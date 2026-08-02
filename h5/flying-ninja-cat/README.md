# 飞天忍者猫 · HTML5 重制版

这是从 `swfs/flying-ninja-cat/Flying-Ninja-Cat.swf` 反编译逻辑后重写的
纯 Canvas 版本。
运行时不加载 SWF、不使用 Ruffle,也不访问外部接口。

当前实现并非所有细节都已逐句沿用原版。完整的来源判定、近似项和恢复优先级见
[`docs/03-飞天忍者猫-逻辑沿用审计.md`](../../docs/03-飞天忍者猫-逻辑沿用审计.md)。

## 运行

在仓库根目录:

```bash
python3 -m http.server 4173
```

打开:

```text
http://127.0.0.1:4173/h5/flying-ninja-cat/
```

不需要安装 npm 依赖。

## 验证

在仓库根目录执行：

```bash
node h5/flying-ninja-cat/tests/rope.test.cjs
node --check h5/flying-ninja-cat/game.js
git diff --check
```

## 操作

- 鼠标、触摸或空格:起跳;
- 空中再次按下:发射绳索;
- 抓住后按住:向上摆动;
- 松开:向下摆动;
- 手机或平板第一次触屏时会立即申请全屏；浏览器安全策略不允许页面在没有
  用户手势时自行进入系统全屏，不支持元素全屏的 iOS Safari 会保持无滚动的
  视口铺满效果;
- 最高分保存在当前浏览器的 `localStorage`。

## 已还原

- 640×480、30 FPS 固定步长;
- 跑、跳、射绳、抓绳、摆荡、旋转、坠落和重新开始;
- 原版地图块宽度、速度、重力和分数公式;
- 原版进度条轨道和猫头子元件，猫头按每关 90px 和关内进度移动;
- `MapData.as` 中的全部地图结构;
- `ItemData.as` 中全部 159 组硬币模板，以及原版 4 列坐标编码、金币/银币、
  整组奖励和难度加速逻辑;
- 原版滚动云层、石猫四种表情、失败屋顶、拾取星光、抓钩命中特效、
  Bonus/Speed/Best 特效和终点 35 帧黑场转场;
- 原版跑步/旋转循环声道，以及终点门和冲出画面的收尾动作;
- 抓绳时 `body` 的真实注册点、`+70°` 角度、无钳制计算、`<-70°` 释放分支，
  以及死亡/高度/角度/绳端的原帧内判断顺序;
- `body.item_pos.hitTest(itemMovieClip)` 对应的变换后 MovieClip 边界相交判定;
- run 6 帧、jump/shoot/rope 各 1 帧、spin 15 帧、die 4 帧的原子时间轴，
  全部按 30 FPS 播放;
- 原版死亡流程：静止 0.3 秒，再以 `Regular.easeIn` 在 0.5 秒内下落 250px;
- 原版标题、游戏背景、角色主状态素材、地图块、金币、Game Over、帮助页关键画面和音频;
- 鼠标、触摸、键盘和响应式缩放。

## 与 SWF 的差异

- 原版的远程提交/排行接口没有移植;
- 按需求移除了结算面板上方的英文/鱼形装饰，以及提交和排名按钮;
- 帮助内容保留为六页静态说明并由 H5 控制翻页，没有照搬原 SWF 的 268 帧
  时间轴过渡;
- 最高分的 `localStorage` 持久化、触摸/Enter 操作和响应式缩放是 H5 新增适配;
- 原版结算页的帮助入口目前也未保留;
- 浏览器禁止未交互自动播放；当前标题音乐只会在进入帮助页等有效交互后启动;
- 原 SWF 和 Ruffle 仅用于本地视觉回归,H5 包本身不依赖它们。

调试时可在控制台执行:

```javascript
window.__ninjaGame.snapshot()
```

它会返回当前状态、分数、速度、地图块、金币数和角色状态。

## 进度条素材

- `assets/ui/progress-track.png`：运行时使用的原版轨道；
- `assets/ui/progress-face.png`：运行时使用、随关卡进度移动的原版猫头；
- `assets/ui/progress.png`：旧的轨道与猫头复合参考图，不参与运行。

## 关键运行素材与坐标

- 精确硬币模板：`item-data.js`；按地图数组签名随机选择同签名模板；
- 角色子时间轴：`assets/cat/run/`、`jump/`、`shoot/`、`rope/`、`spin/`、
  `die/`；目录内帧数与原 SWF 子元件一致；
- 动态石猫：`assets/head/`，绘制原点 `(239.05, 130)`；
- 滚动云层：`assets/backgrounds/clouds.png`，绘制 `y = 318.05`，以 832px 循环；
- 逐帧特效：`assets/effects/`；
- 结算原图：`assets/ui/game-over.png`。运行时只裁出中文标题/成绩面板和“再来一局”；
- 左上角金币和数字由 `game.js` 顶部的 `HUD_COIN_*`、`HUD_SCORE_*` 调整；
- 石掌最高记录由 `BEST_PAW_*`、`BEST_SCORE_*` 调整。
