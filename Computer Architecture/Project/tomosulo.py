# "key" : (op_code, execution time)
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
# Co-authored-by: Ashwin <Ashwin-op@users.noreply.github.com>


# class Instruction():
#     # a dictionary containing instr and execution
#     instr = dict()

#     def __init__(self, instr, ):
#         assert type(instr) == dict
#         self.instr = instr

#     pass


# class RegFile():
#     def __init__(self):
#         self.numOfRegisters = 32
#         self.data = [0] * self.numOfRegisters
#         self.locks = [''] * self.numOfRegisters
#     pass

# Parser

def parser(file_name):
    '''
    LDR     R1, R2              10000 00001 00010 00000 00000 0000000
    ADD     R1, R2, R3          00000 00001 00010 00011 00000 0000000
    MUL     R4, R1, R2          00100 00100 00001 00010 00000 0000000
    MUL     R4, R1, R2, R3      00100 00100 00001 00010 00011 0000000

    Input: String of Assembly level commands
    Output: Operation, Registers
    '''
    instructions = list(tuple())
    with open(file_name) as fp:
        for line in fp.lines():
            line = line.strip()


parser('input_1.txt')
