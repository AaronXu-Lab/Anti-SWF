# SWF 混淆判断流程

> 拿到一个 SWF,**5 分钟内决定**:能不能反编译重写(见 [01](01-反编译重写-尝试记录.md)),
> 还是直接上 Ruffle 壳。
>
> 前置:`brew install openjdk` + `tools/ffdec/`(JPEXS)。每次开终端先
> `export PATH=/opt/homebrew/opt/openjdk/bin:$PATH`。

---

## 30 秒速判(三条命令)

```bash
python3 tools/swfhead.py <文件>.swf
```

```bash
java -jar tools/ffdec/ffdec.jar -export script ./extract/probe ./<文件>.swf
```

```bash
grep -rlc '§§push\|§§pop\|§§constant\|invalid_utf8' ./extract/probe/scripts | head
```

**第三条命令有输出 = 已混淆。** 没输出就去看 `__Packages/`,能读懂就走重写。

---

## 五个信号(按可信度排序)

### 1. `§§push` / `§§pop` / `§§constant` —— 最强信号

JPEXS 用 `§§` 前缀表示「这段字节码无法还原成合法 AS 语句」。
正常编译器产物**不会**留下这些,出现即人为混淆。

```bash
grep -rc '§§' ./extract/probe/scripts/__Packages/*.as | sort -t: -k2 -rn | head
```

### 2. `while(true)` + 数字状态机 —— 控制流打散

真实逻辑被切碎、塞进一个巨大的分发循环,靠一个状态寄存器(常见 `\x01`)跳转:

```javascript
var §\x01§ = 585 + "\x04\x05"();
while(true)
{
   if(eval("\x01") == 966) { set("\x01",eval("\x01") - 892); §§push(true); }
   else if(eval("\x01") == 317) { set("\x01",eval("\x01") - 173); §§push(true); }
   // ...几十个分支
}
```

判据:一个函数里 `eval("\x01") ==` 这种比较出现 **10 次以上**。

```bash
grep -c 'eval("\\x01") ==' ./extract/probe/scripts/__Packages/SetGame.as
```

**AS2 的控制流打散目前没有可用的自动还原工具**(JPEXS 的 `-deobfuscate` 只针对 AS3 P-code)。
见到这个基本可以放弃重写。

### 3. 不可打印的标识符 —— 名字被替换

```
_root["{invalid_utf8=206}{invalid_utf8=198}"]["{invalid_utf8=169}`d{invalid_utf8=139}{invalid_utf8=159}"]
```

变量名/方法名被换成非法 UTF-8 字节。Flash Player 不校验标识符编码,所以能跑,但人读不了。
即使还原了控制流,也不知道每个字段的含义。

```bash
grep -rc 'invalid_utf8' ./extract/probe/scripts/__Packages/*.as | sort -t: -k2 -rn | head
```

### 4. 常量池投毒 —— 最阴的一层,容易误判

同一个 action block 里塞**多个** `ConstantPool`,让静态分析选错池子,
于是反编译出来的代码「语法正确但语义全错」。

看 P-code 才能发现:

```bash
java -jar tools/ffdec/ffdec.jar -format script:pcode -export script ./extract/pcode ./<文件>.swf
```

```bash
grep -c 'ConstantPool' ./extract/pcode/scripts/<某脚本>/DoAction.pcode
```

**一个 action block 里 >1 个 `ConstantPool` 就是投毒。**

本作 `DefineSprite_244/frame_1` 有 5 个池,JPEXS 挑了第 268 行那个,把域名检查反编译成:

```javascript
if(_root["{invalid_utf8=206}{invalid_utf8=198}"]["{invalid_utf8=169}`d..."](dm[_loc4_]) == 0)
_root.xE();
```

而运行时真正生效的是第 153 行的池:

```
ConstantPool "_url", "indexOf", "unloadMovie", "toURL", "", "enabled",
             "domains", "check", "this", "_visible", "gotoAndStop"
```

代进去才是真实语义:

```javascript
if(_root._url.indexOf(dm[i]) == 0) { ok = true; }
// 失败:_root.unloadMovie()   ← 把整个 root 卸载,舞台全黑
```

**识别方法:把各个 `ConstantPool` 逐个代入,读起来像正常代码的那个才是真的。**
`_url` / `indexOf` / `unloadMovie` 拼在一起是通顺的;`xE` + 两个乱码不是。

### 5. 非法 tag code —— 防解析器的垃圾

```bash
python3 tools/swftags.py list <文件>.swf
```

本作输出里有 `253 × 47` 和 `255 × 1`。SWF 规范里没有这些 tag code,
是故意塞的垃圾,用来干扰简易解析器。Flash Player 和 Ruffle 都会跳过未知 tag,不影响运行。

**注意:这条信号单独出现时不一定是恶意混淆**,有些老工具链也会写入私有 tag。当作旁证即可。

---

## 判定表

| 命中信号 | 结论 | 行动 |
| --- | --- | --- |
| 无 | 未混淆 | **走重写**,见 01 号文档 |
| 只有 5 | 基本干净 | 走重写,注意解析器要能跳过未知 tag |
| 1 或 3 | 轻度(只换名字) | 可尝试重写,靠行为反推字段名,慢但可行 |
| 2(控制流打散) | 重度 | **放弃重写,上 Ruffle** |
| 2 + 3 + 4 | 商业级加壳 | 上 Ruffle,别犹豫 |

本作命中 1/2/3/4/5 全部 → Ruffle。

---

## 附:AS3 的情况不一样

上面的信号针对 AS1/AS2。若 `swfhead.py` 报 **AS3(DoABC)**:

- 反编译质量高得多,产物接近可读源码(有真正的类、包、类型标注)
- JPEXS 的 `-deobfuscate` 对 AS3 P-code **确实有效**,先跑一遍再判断
- 常见的只是名字混淆(`class A1 { var _a:int }`),逻辑结构通常还在,重写可行性高很多

```bash
java -jar tools/ffdec/ffdec.jar -deobfuscate <文件>.swf ./extract/deob.swf
```

---

## 决定上 Ruffle 之后:两件事必做

**1. 找出运行时会外部加载的资源。** 混淆过的 SWF 常在运行时 `loadMovie` 另一个资源包,
少一个就黑屏或缺素材。看字符串:

```bash
python3 -c "
import zlib,re
body=zlib.decompress(open('<文件>.swf','rb').read()[8:])
for s in sorted(set(re.findall(rb'[ -~]{4,}',body))):
    if re.search(rb'\.swf|http|\.php|\.aspx',s,re.I): print(s.decode())
"
```

本作靠这条发现了 `FSAGOGUN_RES.swf`——第一次部署漏了它,Ruffle 报 404、整页黑屏。

**2. 掐掉联网。** 上面同一条命令会把上报地址一起列出来。两道防线:

- 播放器层:`allowNetworking:'none'` + `openUrlMode:'deny'`(绝对保证,推荐)
- SWF 层:**等长**常量替换,把 `sendAndLoad` 改成 `sendAndLoaX`
  (AS2 调用不存在的方法是静默 no-op)。见 `tools/strip-score-upload.py`

> **等长是硬约束。** SWF 里的字符串是 null 结尾、顺序排列的,
> 改短会多出一个池条目、后续索引全部错位;改长会撑破 action block 的长度字段。
> 混淆代码里的 `Jump loc####` 还是块内绝对偏移,动一个字节就全崩。
> 所以只做**同长度替换**,不增不减。

---

## 排查黑屏的顺序

按这个顺序查,别像我一样先怀疑域名锁、白花两小时做二进制补丁:

1. **渲染器活着吗** —— 播放器设 `backgroundColor:'#FF0000'`。舞台变红说明渲染正常,问题在内容。
2. **标签页可见吗** —— `document.hidden` 为 true 时 rAF 被节流,Ruffle 不出帧,画布恒黑。
   临时替换:`window.requestAnimationFrame = cb => setTimeout(() => cb(performance.now()), 16)`
3. **有 404 吗** —— 看 network,漏掉运行时资源包是最常见的原因。
4. **JPEXS 渲染的第 1 帧长什么样** —— `frames/1.png`。如果它本来就几乎是空的,
   说明画面靠脚本搭建,黑屏未必异常,该往后翻几帧看。
5. **最后**才怀疑域名锁 / 反调试。

本作实际原因是第 2 条。原始未修改的 SWF 在 localhost 跑得好好的,域名锁根本没触发。
