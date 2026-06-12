; Auto-disassembled from mem/instr_fft8.mem
; Do not optimize before confirming re-assembly matches original machine code.

.equ TEST_BASE,   0x1000
.equ VERIFY_BASE, 0x2000
.equ C707,        0x5a82

MOVI R0, #0                          ; pc=000, raw=0x50000000
MOVI R1, #0                          ; pc=001, raw=0x51000000
MOVI R6, #C707                       ; pc=002, raw=0x56005a82
MOVI R7, #TEST_BASE                  ; pc=003, raw=0x57001000
LDR R2, [R7 + #0]                    ; pc=004, raw=0x72700000
STR R2, [R0 + #0]                    ; pc=005, raw=0x80020000
LDR R2, [R7 + #1]                    ; pc=006, raw=0x72700001
STR R2, [R0 + #1]                    ; pc=007, raw=0x80020001
LDR R2, [R7 + #2]                    ; pc=008, raw=0x72700002
STR R2, [R0 + #2]                    ; pc=009, raw=0x80020002
LDR R2, [R7 + #3]                    ; pc=010, raw=0x72700003
STR R2, [R0 + #3]                    ; pc=011, raw=0x80020003
LDR R2, [R7 + #4]                    ; pc=012, raw=0x72700004
STR R2, [R0 + #4]                    ; pc=013, raw=0x80020004
LDR R2, [R7 + #5]                    ; pc=014, raw=0x72700005
STR R2, [R0 + #5]                    ; pc=015, raw=0x80020005
LDR R2, [R7 + #6]                    ; pc=016, raw=0x72700006
STR R2, [R0 + #6]                    ; pc=017, raw=0x80020006
LDR R2, [R7 + #7]                    ; pc=018, raw=0x72700007
STR R2, [R0 + #7]                    ; pc=019, raw=0x80020007
LDR R2, [R7 + #8]                    ; pc=020, raw=0x72700008
STR R2, [R0 + #8]                    ; pc=021, raw=0x80020008
LDR R2, [R7 + #9]                    ; pc=022, raw=0x72700009
STR R2, [R0 + #9]                    ; pc=023, raw=0x80020009
LDR R2, [R7 + #0x000a]               ; pc=024, raw=0x7270000a
STR R2, [R0 + #0x000a]               ; pc=025, raw=0x8002000a
LDR R2, [R7 + #0x000b]               ; pc=026, raw=0x7270000b
STR R2, [R0 + #0x000b]               ; pc=027, raw=0x8002000b
LDR R2, [R7 + #0x000c]               ; pc=028, raw=0x7270000c
STR R2, [R0 + #0x000c]               ; pc=029, raw=0x8002000c
LDR R2, [R7 + #0x000d]               ; pc=030, raw=0x7270000d
STR R2, [R0 + #0x000d]               ; pc=031, raw=0x8002000d
LDR R2, [R7 + #0x000e]               ; pc=032, raw=0x7270000e
STR R2, [R0 + #0x000e]               ; pc=033, raw=0x8002000e
LDR R2, [R7 + #0x000f]               ; pc=034, raw=0x7270000f
STR R2, [R0 + #0x000f]               ; pc=035, raw=0x8002000f
LDR R8, [R0 + #0]                    ; pc=036, raw=0x78000000
LDR R9, [R0 + #1]                    ; pc=037, raw=0x79000001
LDR R10, [R0 + #8]                   ; pc=038, raw=0x7a000008
LDR R11, [R0 + #9]                   ; pc=039, raw=0x7b000009
ADD R12, R8, R10                     ; pc=040, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=041, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=042, raw=0x228a0000
SUB R3, R9, R11                      ; pc=043, raw=0x239b0000
STR R12, [R0 + #0]                   ; pc=044, raw=0x800c0000
STR R13, [R0 + #1]                   ; pc=045, raw=0x800d0001
STR R2, [R0 + #8]                    ; pc=046, raw=0x80020008
STR R3, [R0 + #9]                    ; pc=047, raw=0x80030009
LDR R8, [R0 + #2]                    ; pc=048, raw=0x78000002
LDR R9, [R0 + #3]                    ; pc=049, raw=0x79000003
LDR R10, [R0 + #0x000a]              ; pc=050, raw=0x7a00000a
LDR R11, [R0 + #0x000b]              ; pc=051, raw=0x7b00000b
ADD R2, R10, R11                     ; pc=052, raw=0x12ab0000
MUL R12, R2, R6                      ; pc=053, raw=0xec260000
SUB R3, R11, R10                     ; pc=054, raw=0x23ba0000
MUL R13, R3, R6                      ; pc=055, raw=0xed360000
ADD R2, R8, R12                      ; pc=056, raw=0x128c0000
ADD R3, R9, R13                      ; pc=057, raw=0x139d0000
SUB R4, R8, R12                      ; pc=058, raw=0x248c0000
SUB R5, R9, R13                      ; pc=059, raw=0x259d0000
STR R2, [R0 + #2]                    ; pc=060, raw=0x80020002
STR R3, [R0 + #3]                    ; pc=061, raw=0x80030003
STR R4, [R0 + #0x000a]               ; pc=062, raw=0x8004000a
STR R5, [R0 + #0x000b]               ; pc=063, raw=0x8005000b
LDR R8, [R0 + #4]                    ; pc=064, raw=0x78000004
LDR R9, [R0 + #5]                    ; pc=065, raw=0x79000005
LDR R10, [R0 + #0x000c]              ; pc=066, raw=0x7a00000c
LDR R11, [R0 + #0x000d]              ; pc=067, raw=0x7b00000d
MOVR R12, R11                        ; pc=068, raw=0x6cb00000
SUB R13, R1, R10                     ; pc=069, raw=0x2d1a0000
ADD R2, R8, R12                      ; pc=070, raw=0x128c0000
ADD R3, R9, R13                      ; pc=071, raw=0x139d0000
SUB R4, R8, R12                      ; pc=072, raw=0x248c0000
SUB R5, R9, R13                      ; pc=073, raw=0x259d0000
STR R2, [R0 + #4]                    ; pc=074, raw=0x80020004
STR R3, [R0 + #5]                    ; pc=075, raw=0x80030005
STR R4, [R0 + #0x000c]               ; pc=076, raw=0x8004000c
STR R5, [R0 + #0x000d]               ; pc=077, raw=0x8005000d
LDR R8, [R0 + #6]                    ; pc=078, raw=0x78000006
LDR R9, [R0 + #7]                    ; pc=079, raw=0x79000007
LDR R10, [R0 + #0x000e]              ; pc=080, raw=0x7a00000e
LDR R11, [R0 + #0x000f]              ; pc=081, raw=0x7b00000f
SUB R2, R11, R10                     ; pc=082, raw=0x22ba0000
MUL R12, R2, R6                      ; pc=083, raw=0xec260000
ADD R3, R10, R11                     ; pc=084, raw=0x13ab0000
SUB R3, R1, R3                       ; pc=085, raw=0x23130000
MUL R13, R3, R6                      ; pc=086, raw=0xed360000
ADD R2, R8, R12                      ; pc=087, raw=0x128c0000
ADD R3, R9, R13                      ; pc=088, raw=0x139d0000
SUB R4, R8, R12                      ; pc=089, raw=0x248c0000
SUB R5, R9, R13                      ; pc=090, raw=0x259d0000
STR R2, [R0 + #6]                    ; pc=091, raw=0x80020006
STR R3, [R0 + #7]                    ; pc=092, raw=0x80030007
STR R4, [R0 + #0x000e]               ; pc=093, raw=0x8004000e
STR R5, [R0 + #0x000f]               ; pc=094, raw=0x8005000f
LDR R8, [R0 + #0]                    ; pc=095, raw=0x78000000
LDR R9, [R0 + #1]                    ; pc=096, raw=0x79000001
LDR R10, [R0 + #4]                   ; pc=097, raw=0x7a000004
LDR R11, [R0 + #5]                   ; pc=098, raw=0x7b000005
ADD R12, R8, R10                     ; pc=099, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=100, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=101, raw=0x228a0000
SUB R3, R9, R11                      ; pc=102, raw=0x239b0000
STR R12, [R0 + #0]                   ; pc=103, raw=0x800c0000
STR R13, [R0 + #1]                   ; pc=104, raw=0x800d0001
STR R2, [R0 + #4]                    ; pc=105, raw=0x80020004
STR R3, [R0 + #5]                    ; pc=106, raw=0x80030005
LDR R8, [R0 + #2]                    ; pc=107, raw=0x78000002
LDR R9, [R0 + #3]                    ; pc=108, raw=0x79000003
LDR R10, [R0 + #6]                   ; pc=109, raw=0x7a000006
LDR R11, [R0 + #7]                   ; pc=110, raw=0x7b000007
MOVR R12, R11                        ; pc=111, raw=0x6cb00000
SUB R13, R1, R10                     ; pc=112, raw=0x2d1a0000
ADD R2, R8, R12                      ; pc=113, raw=0x128c0000
ADD R3, R9, R13                      ; pc=114, raw=0x139d0000
SUB R4, R8, R12                      ; pc=115, raw=0x248c0000
SUB R5, R9, R13                      ; pc=116, raw=0x259d0000
STR R2, [R0 + #2]                    ; pc=117, raw=0x80020002
STR R3, [R0 + #3]                    ; pc=118, raw=0x80030003
STR R4, [R0 + #6]                    ; pc=119, raw=0x80040006
STR R5, [R0 + #7]                    ; pc=120, raw=0x80050007
LDR R8, [R0 + #8]                    ; pc=121, raw=0x78000008
LDR R9, [R0 + #9]                    ; pc=122, raw=0x79000009
LDR R10, [R0 + #0x000c]              ; pc=123, raw=0x7a00000c
LDR R11, [R0 + #0x000d]              ; pc=124, raw=0x7b00000d
ADD R12, R8, R10                     ; pc=125, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=126, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=127, raw=0x228a0000
SUB R3, R9, R11                      ; pc=128, raw=0x239b0000
STR R12, [R0 + #8]                   ; pc=129, raw=0x800c0008
STR R13, [R0 + #9]                   ; pc=130, raw=0x800d0009
STR R2, [R0 + #0x000c]               ; pc=131, raw=0x8002000c
STR R3, [R0 + #0x000d]               ; pc=132, raw=0x8003000d
LDR R8, [R0 + #0x000a]               ; pc=133, raw=0x7800000a
LDR R9, [R0 + #0x000b]               ; pc=134, raw=0x7900000b
LDR R10, [R0 + #0x000e]              ; pc=135, raw=0x7a00000e
LDR R11, [R0 + #0x000f]              ; pc=136, raw=0x7b00000f
MOVR R12, R11                        ; pc=137, raw=0x6cb00000
SUB R13, R1, R10                     ; pc=138, raw=0x2d1a0000
ADD R2, R8, R12                      ; pc=139, raw=0x128c0000
ADD R3, R9, R13                      ; pc=140, raw=0x139d0000
SUB R4, R8, R12                      ; pc=141, raw=0x248c0000
SUB R5, R9, R13                      ; pc=142, raw=0x259d0000
STR R2, [R0 + #0x000a]               ; pc=143, raw=0x8002000a
STR R3, [R0 + #0x000b]               ; pc=144, raw=0x8003000b
STR R4, [R0 + #0x000e]               ; pc=145, raw=0x8004000e
STR R5, [R0 + #0x000f]               ; pc=146, raw=0x8005000f
LDR R8, [R0 + #0]                    ; pc=147, raw=0x78000000
LDR R9, [R0 + #1]                    ; pc=148, raw=0x79000001
LDR R10, [R0 + #2]                   ; pc=149, raw=0x7a000002
LDR R11, [R0 + #3]                   ; pc=150, raw=0x7b000003
ADD R12, R8, R10                     ; pc=151, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=152, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=153, raw=0x228a0000
SUB R3, R9, R11                      ; pc=154, raw=0x239b0000
STR R12, [R0 + #0]                   ; pc=155, raw=0x800c0000
STR R13, [R0 + #1]                   ; pc=156, raw=0x800d0001
STR R2, [R0 + #2]                    ; pc=157, raw=0x80020002
STR R3, [R0 + #3]                    ; pc=158, raw=0x80030003
LDR R8, [R0 + #4]                    ; pc=159, raw=0x78000004
LDR R9, [R0 + #5]                    ; pc=160, raw=0x79000005
LDR R10, [R0 + #6]                   ; pc=161, raw=0x7a000006
LDR R11, [R0 + #7]                   ; pc=162, raw=0x7b000007
ADD R12, R8, R10                     ; pc=163, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=164, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=165, raw=0x228a0000
SUB R3, R9, R11                      ; pc=166, raw=0x239b0000
STR R12, [R0 + #4]                   ; pc=167, raw=0x800c0004
STR R13, [R0 + #5]                   ; pc=168, raw=0x800d0005
STR R2, [R0 + #6]                    ; pc=169, raw=0x80020006
STR R3, [R0 + #7]                    ; pc=170, raw=0x80030007
LDR R8, [R0 + #8]                    ; pc=171, raw=0x78000008
LDR R9, [R0 + #9]                    ; pc=172, raw=0x79000009
LDR R10, [R0 + #0x000a]              ; pc=173, raw=0x7a00000a
LDR R11, [R0 + #0x000b]              ; pc=174, raw=0x7b00000b
ADD R12, R8, R10                     ; pc=175, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=176, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=177, raw=0x228a0000
SUB R3, R9, R11                      ; pc=178, raw=0x239b0000
STR R12, [R0 + #8]                   ; pc=179, raw=0x800c0008
STR R13, [R0 + #9]                   ; pc=180, raw=0x800d0009
STR R2, [R0 + #0x000a]               ; pc=181, raw=0x8002000a
STR R3, [R0 + #0x000b]               ; pc=182, raw=0x8003000b
LDR R8, [R0 + #0x000c]               ; pc=183, raw=0x7800000c
LDR R9, [R0 + #0x000d]               ; pc=184, raw=0x7900000d
LDR R10, [R0 + #0x000e]              ; pc=185, raw=0x7a00000e
LDR R11, [R0 + #0x000f]              ; pc=186, raw=0x7b00000f
ADD R12, R8, R10                     ; pc=187, raw=0x1c8a0000
ADD R13, R9, R11                     ; pc=188, raw=0x1d9b0000
SUB R2, R8, R10                      ; pc=189, raw=0x228a0000
SUB R3, R9, R11                      ; pc=190, raw=0x239b0000
STR R12, [R0 + #0x000c]              ; pc=191, raw=0x800c000c
STR R13, [R0 + #0x000d]              ; pc=192, raw=0x800d000d
STR R2, [R0 + #0x000e]               ; pc=193, raw=0x8002000e
STR R3, [R0 + #0x000f]               ; pc=194, raw=0x8003000f
MOVI R5, #VERIFY_BASE                ; pc=195, raw=0x55002000
LDR R2, [R0 + #0]                    ; pc=196, raw=0x72000000
STR R2, [R5 + #0]                    ; pc=197, raw=0x80520000
LDR R2, [R0 + #1]                    ; pc=198, raw=0x72000001
STR R2, [R5 + #1]                    ; pc=199, raw=0x80520001
LDR R2, [R0 + #8]                    ; pc=200, raw=0x72000008
STR R2, [R5 + #2]                    ; pc=201, raw=0x80520002
LDR R2, [R0 + #9]                    ; pc=202, raw=0x72000009
STR R2, [R5 + #3]                    ; pc=203, raw=0x80520003
LDR R2, [R0 + #4]                    ; pc=204, raw=0x72000004
STR R2, [R5 + #4]                    ; pc=205, raw=0x80520004
LDR R2, [R0 + #5]                    ; pc=206, raw=0x72000005
STR R2, [R5 + #5]                    ; pc=207, raw=0x80520005
LDR R2, [R0 + #0x000c]               ; pc=208, raw=0x7200000c
STR R2, [R5 + #6]                    ; pc=209, raw=0x80520006
LDR R2, [R0 + #0x000d]               ; pc=210, raw=0x7200000d
STR R2, [R5 + #7]                    ; pc=211, raw=0x80520007
LDR R2, [R0 + #2]                    ; pc=212, raw=0x72000002
STR R2, [R5 + #8]                    ; pc=213, raw=0x80520008
LDR R2, [R0 + #3]                    ; pc=214, raw=0x72000003
STR R2, [R5 + #9]                    ; pc=215, raw=0x80520009
LDR R2, [R0 + #0x000a]               ; pc=216, raw=0x7200000a
STR R2, [R5 + #0x000a]               ; pc=217, raw=0x8052000a
LDR R2, [R0 + #0x000b]               ; pc=218, raw=0x7200000b
STR R2, [R5 + #0x000b]               ; pc=219, raw=0x8052000b
LDR R2, [R0 + #6]                    ; pc=220, raw=0x72000006
STR R2, [R5 + #0x000c]               ; pc=221, raw=0x8052000c
LDR R2, [R0 + #7]                    ; pc=222, raw=0x72000007
STR R2, [R5 + #0x000d]               ; pc=223, raw=0x8052000d
LDR R2, [R0 + #0x000e]               ; pc=224, raw=0x7200000e
STR R2, [R5 + #0x000e]               ; pc=225, raw=0x8052000e
LDR R2, [R0 + #0x000f]               ; pc=226, raw=0x7200000f
STR R2, [R5 + #0x000f]               ; pc=227, raw=0x8052000f
HALT                                 ; pc=228, raw=0xf0000000
