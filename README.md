# Anti-SWF

把老 Flash 游戏搬进浏览器的工作区。

## 先读哪份

| 想干什么 | 看这里 |
| --- | --- |
| 刚拿到一个 SWF,不知道能不能反编译 | [docs/02-SWF-混淆判断流程.md](docs/02-SWF-混淆判断流程.md) —— 5 分钟出结论 |
| 确认没混淆,要重写成 H5 | [docs/01-反编译重写-尝试记录.md](docs/01-反编译重写-尝试记录.md) |
| 混淆了,要上 Ruffle 壳 | 02 号文档末尾「决定上 Ruffle 之后」 + 参考 `flying-ninja-cat` 的成品 |

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
| `strip-score-upload.py` | 等长常量替换,摘掉 SWF 里的成绩联网上报 |

## 已完成

**飞天忍者猫** —— 五项混淆信号全中(控制流打散 + 标识符替换 + 常量池投毒 + 非法 tag),
放弃重写,改用自托管 Ruffle 跑原版 SWF。成品在主站仓库
`public/tools/flying-ninja-cat/`,已上「玩个 Go」。

联网上报双重掐断:SWF 层替换两处 `sendAndLoad`,播放器层
`allowNetworking:'none'` + `openUrlMode:'deny'`。实测点「提交」零外部请求。

素材导出在 `extract/ninja-cat/`(75 位图 / 110 矢量 / 1193 sprite / 20 音频),
即使走 Ruffle 方案也能复用——卡片图标就是从 `images/100.png` 来的。
