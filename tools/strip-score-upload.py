#!/usr/bin/env python3
"""
摘掉 Flying-Ninja-Cat.swf 里的成绩联网上报。

原版有两条上报链路，都靠 LoadVars.sendAndLoad 发 POST：

  1. DefineSprite_227（游戏结束面板的「提交」按钮）
       submitLv.sendAndLoad("/Flying-Ninja-Cat/Scores.aspx", ..., "POST")
  2. 游戏内排行榜 ranking_mc
       -> http://jhworks.cafe24.com/count.php
       -> http://211.110.89.169/flashgame/insertRank.php?gameid=fsagogun2&userid=...

做等长（11 字节）常量替换：

    sendAndLoad  ->  sendAndLoaX

AS2 里调用对象上不存在的方法是静默 no-op，于是两处上报都变成什么都不做：
不发请求、不回调、也不会弹「无法连接服务器！」。除这 2 处外不动任何字节。

播放器层面还额外设了 allowNetworking:'none' + openUrlMode:'deny' 作为兜底，
两道防线互相独立。
"""

import sys
import zlib
from pathlib import Path

OLD = b"sendAndLoad"
NEW = b"sendAndLoaX"
EXPECTED = 2


def main(src: Path, dst: Path) -> None:
    raw = src.read_bytes()
    if raw[:3] != b"CWS":
        sys.exit(f"{src}: 只支持 zlib 压缩的 CWS，实际是 {raw[:3]!r}")

    body = zlib.decompress(raw[8:])
    hits = body.count(OLD)
    if hits != EXPECTED:
        sys.exit(f"{src}: 期望 {EXPECTED} 处 {OLD.decode()}，实际 {hits} 处 —— 中止")

    patched = body.replace(OLD, NEW)
    assert len(patched) == len(body), "补丁必须等长"

    dst.write_bytes(raw[:8] + zlib.compress(patched, 9))
    print(f"已摘除成绩上报：{dst}（{hits} 处 {OLD.decode()} → {NEW.decode()}）")


if __name__ == "__main__":
    main(Path(sys.argv[1]), Path(sys.argv[2]))
