# Anti-SWF

把老 Flash 游戏反编译、验证并重写成可独立运行的 HTML5 游戏。

## 目录

| 目录 | 用途 |
| --- | --- |
| [`.agents/skills/`](.agents/skills/) | 项目级 AI 工作流技能 |
| [`docs/`](docs/) | 通用流程、研究记录和迁移文档 |
| [`tools/scripts/`](tools/scripts/) | 仓库维护的反编译、分析和补丁脚本 |
| [`tools/vendor/`](tools/vendor/) | FFDec、Ruffle 等第三方工具 |
| [`swfs/`](swfs/) | 按游戏保存不可替代的原始 SWF 输入和清单 |
| [`h5/`](h5/) | 按游戏保存可独立运行的最终 HTML5 内容 |
| `temp/` | 可重新生成的反编译输出与临时验证产物；不纳入版本管理 |

`temp/` 可以整体删除。最终 H5 不得读取其中任何文件。

转换新游戏时使用项目技能
[`$convert-swf-to-h5`](.agents/skills/convert-swf-to-h5/SKILL.md)，它覆盖从
SWF 评估、反编译和素材清洗到 H5 重写与最终验收的完整流程。

## 飞天忍者猫

- 原始文件与哈希清单：[`swfs/flying-ninja-cat/`](swfs/flying-ninja-cat/)
- HTML5 重制版：[`h5/flying-ninja-cat/`](h5/flying-ninja-cat/)
- 研究记录：[`docs/01-反编译重写-尝试记录.md`](docs/01-反编译重写-尝试记录.md)

运行：

```bash
python3 -m http.server 4173
```

打开：

```text
http://127.0.0.1:4173/h5/flying-ninja-cat/
```

验证：

```bash
node h5/flying-ninja-cat/tests/rope.test.cjs
node --check h5/flying-ninja-cat/game.js
git diff --check
```

## 反编译

安装 Java：

```bash
brew install openjdk
```

使用保守参数导出 AS1/2：

```bash
tools/scripts/decompile-as2.sh \
  swfs/flying-ninja-cat/Flying-Ninja-Cat.swf \
  temp/flying-ninja-cat/work/extract/deob-safe
```

详细判断流程见 [`docs/02-SWF-混淆判断流程.md`](docs/02-SWF-混淆判断流程.md)。
