#!/usr/bin/env python3
"""
Compare two .mem files by hex words, ignoring whitespace and commas.

Usage:
  python scripts/compare_mem.py mem/instr_fft8.mem mem/instr_fft8_rebuild.mem
"""

import argparse
from pathlib import Path


def read_words(path: str) -> list[str]:
    text = Path(path).read_text(encoding="utf-8")
    words: list[str] = []

    for token in text.replace(",", " ").replace(";", " ").split():
        token = token.strip().lower()
        if not token:
            continue
        if token.startswith("memory_initialization"):
            continue
        words.append(f"{int(token, 16):08x}")

    return words


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("a")
    parser.add_argument("b")
    args = parser.parse_args()

    a = read_words(args.a)
    b = read_words(args.b)

    if len(a) != len(b):
        print(f"FAIL: length mismatch: {args.a} has {len(a)}, {args.b} has {len(b)}")
        raise SystemExit(1)

    for i, (wa, wb) in enumerate(zip(a, b)):
        if wa != wb:
            print(f"FAIL: mismatch at pc={i}: {args.a}=0x{wa}, {args.b}=0x{wb}")
            raise SystemExit(1)

    print(f"PASS: {len(a)} instructions match exactly.")


if __name__ == "__main__":
    main()
