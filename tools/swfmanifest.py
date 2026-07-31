#!/usr/bin/env python3
"""Print AS1/2 export names and MovieClip frame labels from a SWF."""

from __future__ import annotations

import struct
import sys
import zlib
from pathlib import Path


def decompress(path: Path) -> bytes:
    raw = path.read_bytes()
    if raw[:3] == b"FWS":
        return raw[8:]
    if raw[:3] == b"CWS":
        return zlib.decompress(raw[8:])
    raise ValueError(f"Unsupported SWF signature: {raw[:3]!r}")


def rect_length(data: bytes) -> int:
    bit_count = data[0] >> 3
    return (5 + bit_count * 4 + 7) // 8


def tags(data: bytes, start: int, end: int | None = None):
    limit = len(data) if end is None else end
    position = start
    while position + 2 <= limit:
        code_and_length = struct.unpack_from("<H", data, position)[0]
        code = code_and_length >> 6
        length = code_and_length & 0x3F
        header_length = 2
        if length == 0x3F:
            if position + 6 > limit:
                return
            length = struct.unpack_from("<I", data, position + 2)[0]
            header_length = 6
        payload_start = position + header_length
        payload_end = payload_start + length
        if payload_end > limit:
            return
        yield code, payload_start, payload_end
        if code == 0:
            return
        position = payload_end


def c_string(data: bytes, position: int, limit: int) -> tuple[str, int]:
    end = data.find(b"\0", position, limit)
    if end < 0:
        end = limit
    value = data[position:end].decode("utf-8", "replace")
    return value, min(end + 1, limit)


def named_characters(data: bytes, top_level_start: int) -> dict[int, str]:
    names: dict[int, str] = {}
    for code, start, end in tags(data, top_level_start):
        if code not in (56, 76) or start + 2 > end:
            continue
        count = struct.unpack_from("<H", data, start)[0]
        position = start + 2
        for _ in range(count):
            if position + 2 > end:
                break
            character_id = struct.unpack_from("<H", data, position)[0]
            name, position = c_string(data, position + 2, end)
            names[character_id] = name
    return names


def sprite_labels(
    data: bytes, top_level_start: int
) -> list[tuple[int, int, list[tuple[int, str]]]]:
    sprites = []
    for code, start, end in tags(data, top_level_start):
        if code != 39 or start + 4 > end:
            continue
        sprite_id, frame_count = struct.unpack_from("<HH", data, start)
        frame = 1
        labels: list[tuple[int, str]] = []
        for nested_code, nested_start, nested_end in tags(data, start + 4, end):
            if nested_code == 43:
                label, _ = c_string(data, nested_start, nested_end)
                labels.append((frame, label))
            elif nested_code == 1:
                frame += 1
        sprites.append((sprite_id, frame_count, labels))
    return sprites


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit(f"Usage: {Path(sys.argv[0]).name} FILE.swf")

    path = Path(sys.argv[1])
    data = decompress(path)
    top_level_start = rect_length(data) + 4
    names = named_characters(data, top_level_start)

    print(f"{path.name}")
    print("Exported characters:")
    for character_id, name in sorted(names.items()):
        print(f"  {character_id:>4}  {name}")

    print("MovieClip labels:")
    for sprite_id, frame_count, labels in sprite_labels(data, top_level_start):
        if not labels:
            continue
        label_text = ", ".join(f"{frame}:{label}" for frame, label in labels)
        suffix = f" ({names[sprite_id]})" if sprite_id in names else ""
        print(f"  {sprite_id:>4}{suffix} · {frame_count} frames · {label_text}")


if __name__ == "__main__":
    main()
