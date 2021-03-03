import re
regNum = 32
regFile = [] * regNum
instr = {
    'ADD':  (bin(0), 6),
    'ADC':  (bin(1), 6),
    'SUB':  (bin(2), 6),
    'SBC':  (bin(3), 6),
    'MUL':  (bin(4), 18),
    'FADD': (bin(5), 8),
    'FSUB': (bin(6), 8),
    'FMUL': (bin(7), 18),
    'AND':  (bin(8), 1),
    'OR':   (bin(9), 1),
    'NAND': (bin(10), 1),
    'NOR':  (bin(11), 1),
    'XOR':  (bin(12), 1),
    'XNOR': (bin(13), 1),
    'NOT':  (bin(14), 1),
    'NEG':  (bin(15), 1),
    'LDR':  (bin(16), 1),
    'STR':  (bin(17), 1),
    'HLT':  (bin(18), 1)
}
regWrt = {
    "R0": 0, "R1": 0, "R2": 0, "R3": 0, "R4": 0, "R5": 0, "R6": 0, "R7": 8, "R9": 0,
    "R10": 0, "R11": 0, "R12": 0, "R13": 0, "R14": 0, "R15": 0, "R16": 0, "R17": 8, "R19": 0,
    "R20": 0, "R21": 0, "R22": 0, "R23": 0, "R24": 0, "R25": 0, "R26": 0, "R27": 8, "R29": 0,
    "R30": 0, "R31": 0
}
instr2Operands = [
    'LDR', 'STR'
]
nInstrPacked = 4
strings = lambda x: x and type(re.fullmatch(r'[a-zA-Z0-9]+', x)) == re.Match
schedule = []

def updateSched():
    for reg in regWrt:
        if regWrt[reg] <= time:
            regWrt[reg] = 0

def schedulable(codeLine, time):
    # remove the instructions that have completed execution
    updateSched()
    execTime = instr[codeLine[0]][1]
    # this checks RAW and WAW, any operation before the write is issued but not complete is to return False
    # check if the instr is str/ldr -- then check 1 reg otherwise 2
    if (codeLine[0] in instr2Operands and regWrt[codeLine[1]] == 0) or (regWrt[codeLine[1]] == 0 and regWrt[codeLine[2]] == 0):
        # update the exec time of reg into which the instr writes
        regWrt[codeLine[1]] = time + execTime
        # special case for 'MUL'
        if codeLine[0] == 'MUL' and len(codeLine) == 5:
            regWrt[codeLine[-1]] = time + execTime
        return True
    else:
        return False

with open('./input_1.txt') as fh:
    time = 0
    lines = fh.readlines()
    codeLen = len(lines)
    i = 0
    while i < codeLen:
        for j in range(nInstrPacked):
            # read the line of code
            if i + j == codeLen:
                 break
            line = lines[i + j]
            # split the line of code and take the instr destReg srcReg1 srcReg2 srcReg3
            codeLine = [x.strip() for x in re.split(r', |( )|,', line) if x and strings(x.strip())]
            print(codeLine)
            if codeLine[0] != 'HLT':
                # spinning wait until the instr is schedulable
                while schedulable(codeLine, time) == False:
                    time += 1
                time += 1
            schedule.append((codeLine, time))
        i += j
print(schedule)