
    MOV  R0, #0x80000000
    MOV  R1, #0x00000001
    MOV  R2, #0xFFFFFFFF
    TSTS R2,R2
    SUBS R2, R0, R1  ; C and V Set

    MOV R0, #-1
;    CMN R1, R0
