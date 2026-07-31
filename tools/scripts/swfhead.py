#!/usr/bin/env python3
"""
读 SWF 文件头:舞台尺寸、帧率、帧数、AS 版本、压缩方式。

用法:
    python3 tools/scripts/swfhead.py <文件.swf> [更多文件.swf ...]

SWF 头部布局(压缩的话，只有前 8 字节是明文，之后整体压缩):
    [0:3]  签名  FWS=未压缩 / CWS=zlib / ZWS=LZMA
    [3]    version
    [4:8]  解压后总长度(小端 u32)
    ----- 以下是压缩区 -----
    RECT   舞台矩形(位打包，单位 twips，1px = 20twips)
    u16    帧率(8.8 定点，低字节在前)
    u16    帧数
"""

import struct
import sys
import zlib
from pathlib import Path


def decompress(raw: bytes) -> bytes:
    sig = raw[:3]
    if sig == b"FWS":
        return raw[8:]
    if sig == b"CWS":
        return zlib.decompress(raw[8:])
    if sig == b"ZWS":
        import lzma

        # SWF 的 LZMA:[8:12]=压缩长度, [12:17]=lzma props, 之后是数据
        props, data = raw[12:17], raw[17:]
        dec = lzma.LZMADecompressor(lzma.FORMAT_ALONE, filters=None)
        return dec.decompress(props + b"\xff" * 8 + data)
    sys.exit(f"未知签名 {sig!r}")


def read_rect(body: bytes) -> tuple[list[int], int]:
    """返回 (xmin,xmax,ymin,ymax) 的 twips 值和 RECT 占用的字节数。"""
    nbits = body[0] >> 3
    total_bits = 5 + nbits * 4
    nbytes = (total_bits + 7) // 8
    bits = "".join(f"{b:08b}" for b in body[:nbytes])

    def signed(chunk: str) -> int:
        v = int(chunk, 2)
        return v - (1 << len(chunk)) if chunk[0] == "1" and len(chunk) > 0 else v

    vals = [signed(bits[5 + i * nbits : 5 + (i + 1) * nbits]) for i in range(4)]
    return vals, nbytes


def describe(path: Path) -> None:
    raw = path.read_bytes()
    sig = raw[:3].decode("ascii", "replace")
    version = raw[3]
    (declared,) = struct.unpack("<I", raw[4:8])

    body = decompress(raw)
    (xmin, xmax, ymin, ymax), off = read_rect(body)
    frame_rate = body[off + 1] + body[off] / 256
    (frame_count,) = struct.unpack("<H", body[off + 2 : off + 4])

    # AS3 的判据:version >= 9 且存在 DoABC tag(code 72 或 82)
    has_abc = False
    pos = off + 4
    while pos + 2 <= len(body):
        (code_len,) = struct.unpack("<H", body[pos : pos + 2])
        code, length = code_len >> 6, code_len & 0x3F
        hdr = 2
        if length == 0x3F:
            (length,) = struct.unpack("<I", body[pos + 2 : pos + 6])
            hdr = 6
        if code in (72, 82):
            has_abc = True
            break
        if code == 0:
            break
        pos += hdr + length

    compression = {"FWS": "未压缩", "CWS": "zlib", "ZWS": "LZMA"}.get(sig, sig)
    print(f"{path.name}")
    print(f"  签名/版本   {sig} v{version}（{compression}）")
    print(f"  舞台        {(xmax - xmin) / 20:g} × {(ymax - ymin) / 20:g} px")
    print(f"  帧率/帧数   {frame_rate:g} fps · {frame_count} 帧")
    print(f"  脚本        {'AS3（DoABC）' if has_abc else 'AS1/AS2（DoAction）'}")
    print(f"  体积        磁盘 {len(raw):,} B / 解压后 {declared:,} B")


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    for arg in sys.argv[1:]:
        describe(Path(arg))
