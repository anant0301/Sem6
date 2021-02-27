START:

    ; set Zero(Z) as 1
    MOVS    R0, #0                  ;   sets NZC = b010

    ; set Negative(N) as 1
    MOVS    R0, #-1                 ;   sets NZC = b100
    
    ; set Carry(C) as 1    
    CMP     R0, R1                  ;   sets NZC = b101
    MOVS    R0, #0x7FFFFFFF         ;   sets N = 0 ==> NZC = b001

    ; set Overflow(V) as 1
    ADDS    R0, R0, R0              ;   sets NZCV = b1001
    MOVS    R0, #1                  ;   sets NZC = b000 ==> NZCV = b0001

HLT:
    BAL HLT
