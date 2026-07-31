#!/usr/bin/env python3
"""SWF 标签层工具：列出 / 过滤顶层 tag。用于定位 Ruffle 黑屏原因。"""

import struct
import sys
import zlib
from pathlib import Path

TAG_NAMES = {
    0: "End", 1: "ShowFrame", 9: "SetBackgroundColor", 12: "DoAction",
    26: "PlaceObject2", 28: "RemoveObject2", 39: "DefineSprite",
    59: "DoInitAction", 69: "FileAttributes", 70: "PlaceObject3",
    76: "SymbolClass", 77: "Metadata", 86: "DefineSceneAndFrameLabelData",
}


def read_body(path: Path) -> tuple[bytes, bytes]:
    raw = path.read_bytes()
    if raw[:3] == b"CWS":
        return raw[:8], zlib.decompress(raw[8:])
    if raw[:3] == b"FWS":
        return raw[:8], raw[8:]
    sys.exit(f"{path}: 不支持的签名 {raw[:3]!r}")


def rect_len(body: bytes, at: int) -> int:
    nbits = body[at] >> 3
    return (5 + nbits * 4 + 7) // 8


def tag_start(body: bytes) -> int:
    """跳过 RECT + frameRate(2) + frameCount(2)。"""
    return rect_len(body, 0) + 4


def walk(body: bytes, start: int):
    """产出 (code, tag_start_offset, tag_end_offset)。"""
    pos = start
    while pos + 2 <= len(body):
        (code_len,) = struct.unpack("<H", body[pos : pos + 2])
        code, length = code_len >> 6, code_len & 0x3F
        hdr = 2
        if length == 0x3F:
            (length,) = struct.unpack("<I", body[pos + 2 : pos + 6])
            hdr = 6
        end = pos + hdr + length
        yield code, pos, end
        if code == 0:
            return
        pos = end


def cmd_list(path: Path) -> None:
    head, body = read_body(path)
    counts: dict[int, int] = {}
    for code, _, _ in walk(body, tag_start(body)):
        counts[code] = counts.get(code, 0) + 1
    print(f"{path.name} 顶层 tag 统计：")
    for code in sorted(counts):
        print(f"  {code:>3} {TAG_NAMES.get(code, ''):<28} × {counts[code]}")


def cmd_strip(path: Path, dst: Path, drop: set[int]) -> None:
    head, body = read_body(path)
    start = tag_start(body)
    out = bytearray(body[:start])
    removed = 0
    for code, a, b in walk(body, start):
        if code in drop:
            removed += 1
            continue
        out += body[a:b]
    dst.write_bytes(head[:8] + zlib.compress(bytes(out), 9))
    print(f"{dst.name}: 移除 {removed} 个 tag {sorted(drop)}")


if __name__ == "__main__":
    if sys.argv[1] == "list":
        cmd_list(Path(sys.argv[2]))
    elif sys.argv[1] == "strip":
        cmd_strip(Path(sys.argv[2]), Path(sys.argv[3]), {int(x) for x in sys.argv[4].split(",")})
