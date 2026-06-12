; fft8_speed_v2.asm
; Optimization:
; 1. Stage 1 reads inputs directly from test_ROM.
; 2. Stage 3 writes final FFT results directly to verify_RAM.
; 3. Removed final internal-RAM-to-verify-RAM copy.

.equ TEST_BASE,   0x1000
.equ VERIFY_BASE, 0x2000
.equ C707,        0x5a82

; Init
MOVI R0, #0
MOVI R1, #0
MOVI R6, #C707
MOVI R7, #TEST_BASE

; =========================
; Stage 1
; read test_ROM, write internal RAM
; =========================

LDR R8, [R7 + #0]
LDR R9, [R7 + #1]
LDR R10, [R7 + #8]
LDR R11, [R7 + #9]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R0 + #0]
STR R13, [R0 + #1]
STR R2, [R0 + #8]
STR R3, [R0 + #9]

LDR R8, [R7 + #2]
LDR R9, [R7 + #3]
LDR R10, [R7 + #0x000a]
LDR R11, [R7 + #0x000b]
ADD R2, R10, R11
MUL R12, R2, R6
SUB R3, R11, R10
MUL R13, R3, R6
ADD R2, R8, R12
ADD R3, R9, R13
SUB R4, R8, R12
SUB R5, R9, R13
STR R2, [R0 + #2]
STR R3, [R0 + #3]
STR R4, [R0 + #0x000a]
STR R5, [R0 + #0x000b]

LDR R8, [R7 + #4]
LDR R9, [R7 + #5]
LDR R10, [R7 + #0x000c]
LDR R11, [R7 + #0x000d]
MOVR R12, R11
SUB R13, R1, R10
ADD R2, R8, R12
ADD R3, R9, R13
SUB R4, R8, R12
SUB R5, R9, R13
STR R2, [R0 + #4]
STR R3, [R0 + #5]
STR R4, [R0 + #0x000c]
STR R5, [R0 + #0x000d]

LDR R8, [R7 + #6]
LDR R9, [R7 + #7]
LDR R10, [R7 + #0x000e]
LDR R11, [R7 + #0x000f]
SUB R2, R11, R10
MUL R12, R2, R6
ADD R3, R10, R11
SUB R3, R1, R3
MUL R13, R3, R6
ADD R2, R8, R12
ADD R3, R9, R13
SUB R4, R8, R12
SUB R5, R9, R13
STR R2, [R0 + #6]
STR R3, [R0 + #7]
STR R4, [R0 + #0x000e]
STR R5, [R0 + #0x000f]

; =========================
; Stage 2
; read/write internal RAM
; =========================

LDR R8, [R0 + #0]
LDR R9, [R0 + #1]
LDR R10, [R0 + #4]
LDR R11, [R0 + #5]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R0 + #0]
STR R13, [R0 + #1]
STR R2, [R0 + #4]
STR R3, [R0 + #5]

LDR R8, [R0 + #2]
LDR R9, [R0 + #3]
LDR R10, [R0 + #6]
LDR R11, [R0 + #7]
MOVR R12, R11
SUB R13, R1, R10
ADD R2, R8, R12
ADD R3, R9, R13
SUB R4, R8, R12
SUB R5, R9, R13
STR R2, [R0 + #2]
STR R3, [R0 + #3]
STR R4, [R0 + #6]
STR R5, [R0 + #7]

LDR R8, [R0 + #8]
LDR R9, [R0 + #9]
LDR R10, [R0 + #0x000c]
LDR R11, [R0 + #0x000d]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R0 + #8]
STR R13, [R0 + #9]
STR R2, [R0 + #0x000c]
STR R3, [R0 + #0x000d]

LDR R8, [R0 + #0x000a]
LDR R9, [R0 + #0x000b]
LDR R10, [R0 + #0x000e]
LDR R11, [R0 + #0x000f]
MOVR R12, R11
SUB R13, R1, R10
ADD R2, R8, R12
ADD R3, R9, R13
SUB R4, R8, R12
SUB R5, R9, R13
STR R2, [R0 + #0x000a]
STR R3, [R0 + #0x000b]
STR R4, [R0 + #0x000e]
STR R5, [R0 + #0x000f]

; =========================
; Stage 3
; write final results directly to verify_RAM
; output order follows original final copy mapping:
; 0,1,8,9,4,5,12,13,2,3,10,11,6,7,14,15
; =========================

MOVI R5, #VERIFY_BASE

LDR R8, [R0 + #0]
LDR R9, [R0 + #1]
LDR R10, [R0 + #2]
LDR R11, [R0 + #3]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R5 + #0]
STR R13, [R5 + #1]
STR R2, [R5 + #8]
STR R3, [R5 + #9]

LDR R8, [R0 + #4]
LDR R9, [R0 + #5]
LDR R10, [R0 + #6]
LDR R11, [R0 + #7]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R5 + #4]
STR R13, [R5 + #5]
STR R2, [R5 + #0x000c]
STR R3, [R5 + #0x000d]

LDR R8, [R0 + #8]
LDR R9, [R0 + #9]
LDR R10, [R0 + #0x000a]
LDR R11, [R0 + #0x000b]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R5 + #2]
STR R13, [R5 + #3]
STR R2, [R5 + #0x000a]
STR R3, [R5 + #0x000b]

LDR R8, [R0 + #0x000c]
LDR R9, [R0 + #0x000d]
LDR R10, [R0 + #0x000e]
LDR R11, [R0 + #0x000f]
ADD R12, R8, R10
ADD R13, R9, R11
SUB R2, R8, R10
SUB R3, R9, R11
STR R12, [R5 + #6]
STR R13, [R5 + #7]
STR R2, [R5 + #0x000e]
STR R3, [R5 + #0x000f]

HALT