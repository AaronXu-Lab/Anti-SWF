# Anti-SWF

把老 Flash 游戏搬进浏览器的工作区。

## 先读哪份

| 想干什么 | 看这里 |
| --- | --- |
| 刚拿到一个 SWF,不知道能不能反编译 | [docs/02-SWF-混淆判断流程.md](docs/02-SWF-混淆判断流程.md) —— 5 分钟出结论 |
| AS1/2 有混淆,想先抢救源码 | `tools/decompile-as2.sh` + [docs/01-反编译重写-尝试记录.md](docs/01-反编译重写-尝试记录.md) |
| 要重写成纯 H5 | [h5/](h5/) —— 本作的可玩 Canvas 重制版 |
| 确实无法还原,要上 Ruffle 壳 | 02 号文档末尾「决定上 Ruffle 之后」 |

## 环境

不需要管理员密码:

```bash
brew install openjdk
```

每次开终端:

```bash
export PATH=/opt/homebrew/opt/openjdk/bin:$PATH
```

## tools/

| 工具 | 用途 |
| --- | --- |
| `ffdec/` | JPEXS 21.1.0,反编译 / 导素材。`java -jar tools/ffdec/ffdec.jar --help` |
| `ruffle-selfhosted/` | Ruffle 0.4.1 自托管构建(js + 两份 wasm) |
| `swfhead.py` | 读文件头:舞台尺寸、帧率、帧数、AS2/AS3、压缩方式 |
| `swftags.py` | tag 层 `list` / `strip`,用于看结构、剥离 DoAction 做对照实验 |
| `swfmanifest.py` | 列出 ExportAssets、MovieClip 帧数和帧标签,用于把类名映射回素材 |
| `decompile-as2.sh` | 用本作验证过的保守参数反编译带混淆的 AS1/2 |
| `strip-score-upload.py` | 等长常量替换,摘掉 SWF 里的成绩联网上报 |

## 已完成

**飞天忍者猫** —— 五项混淆信号全中,但并非不能还原。JPEXS 的 AS1/2
执行式反混淆在提高执行上限、关闭激进重命名和无效赋值删除后,成功恢复了
152 份脚本。`SetGame.as` 的 48 个方法、地图、道具表、计分和绳索状态机均可读。

纯 H5 重制版位于 [h5/](h5/),不含 SWF、Ruffle 或外部联网:

```bash
python3 -m http.server 4173
```

打开 `http://127.0.0.1:4173/h5/`。支持鼠标、触摸和空格键,最高分保存在
浏览器本地。打包后的原版素材约 2.6 MB。

Ruffle 版仍保留作逐帧行为参照;它不再是唯一方案。
