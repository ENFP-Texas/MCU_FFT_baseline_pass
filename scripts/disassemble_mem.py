#!/usr/bin/env python3
"""
Disassemble MCU .mem machine code into readable .asm.

Usage:
  python scripts/disassemble_mem.py mem/instr_fft8.mem -o asm/fft8_baseline.asm
"""

import argparse
from pathlib import Path


OPNAMES = {
    0x0: "NOP",
    0x1: "ADD",
    0x2: "SUB",
    0x3: "AND",
    0x4: "OR",
    0x5: "MOVI",
    0x6: "MOVR",
    0x7: "LDR",
    0x8: "STR",
    0x9: "B",
    0xA: "BL",
    0xB: "CMP",
    0xC: "BEQ",
    0xD: "BNE",
    0xE: "MUL",
    0xF: "HALT",
}


def read_words(path: str | Path) -> list[int]:
    text = Path(path).read_text(encoding="utf-8")
    words: list[int] = []

    for token in text.replace(",", " ").replace(";", " ").split():
        token = token.strip()
        if not token:
            continue
        if token.lower().startswith("memory_initialization"):
            continue
        words.append(int(token, 16))

    return words


def fmt_reg(x: int) -> str:
    return f"R{x}"


def fmt_imm(x: int) -> str:
    """
    Use symbols for important constants.
    Keep small offsets as decimal for readability.
    """
    if x == 0x1000:
        return "#TEST_BASE"
    if x == 0x2000:
        return "#VERIFY_BASE"
    if x == 0x5A82:
        return "#C707"
    if 0 <= x <= 9:
        return f"#{x}"
    return f"#0x{x:04x}"


def decode_word(word: int) -> str:
    op = (word >> 28) & 0xF
    rd = (word >> 24) & 0xF
    rs1 = (word >> 20) & 0xF
    rs2 = (word >> 16) & 0xF
    imm16 = word & 0xFFFF

    name = OPNAMES.get(op, f"OP_{op:x}")

    if name in ("NOP", "HALT"):
        return name

    if name in ("ADD", "SUB", "AND", "OR", "MUL"):
        return f"{name} {fmt_reg(rd)}, {fmt_reg(rs1)}, {fmt_reg(rs2)}"

    if name == "MOVI":
        return f"MOVI {fmt_reg(rd)}, {fmt_imm(imm16)}"

    if name == "MOVR":
        return f"MOVR {fmt_reg(rd)}, {fmt_reg(rs1)}"

    if name == "LDR":
        return f"LDR {fmt_reg(rd)}, [{fmt_reg(rs1)} + {fmt_imm(imm16)}]"

    if name == "STR":
        return f"STR {fmt_reg(rs2)}, [{fmt_reg(rs1)} + {fmt_imm(imm16)}]"

    if name in ("B", "BL", "BEQ", "BNE"):
        return f"{name} {fmt_imm(imm16)}"

    if name == "CMP":
        return f"CMP {fmt_reg(rs1)}, {fmt_reg(rs2)}"

    return f"; UNKNOWN 0x{word:08x}"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("mem", help="input .mem file, e.g. mem/instr_fft8.mem")
    parser.add_argument("-o", "--out", required=True, help="output .asm file")
    args = parser.parse_args()

    words = read_words(args.mem)

    lines: list[str] = []
    lines.append("; Auto-disassembled from mem/instr_fft8.mem")
    lines.append("; Do not optimize before confirming re-assembly matches original machine code.")
    lines.append("")
    lines.append(".equ TEST_BASE,   0x1000")
    lines.append(".equ VERIFY_BASE, 0x2000")
    lines.append(".equ C707,        0x5a82")
    lines.append("")

    for pc, word in enumerate(words):
        asm = decode_word(word)
        lines.append(f"{asm:<36} ; pc={pc:03d}, raw=0x{word:08x}")

    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out).write_text("\n".join(lines) + "\n", encoding="utf-8")

    print(f"disassembled {len(words)} instructions -> {args.out}")


if __name__ == "__main__":
    main()
