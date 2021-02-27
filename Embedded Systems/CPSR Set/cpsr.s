START:
    MOVS    R0, #0x80000000
    MOVS    R1, #-1
    MOVS    R3, #0
    ADDS    R2, R0, R1
    MOVS    R3, #0
    MOV     R3, #0xFFFFFFFF
    MOVS    R3, R3, ROR #2

HLT:
    BAL HLT