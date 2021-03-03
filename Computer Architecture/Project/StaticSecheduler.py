class StaticScheduler():
    instr_exec_time = {
        bin(0):     6,
        bin(1):     6,
        bin(2):     6,
        bin(3):     6,
        bin(4):     18,
        bin(5):     8,
        bin(6):     8,
        bin(7):     18,
        bin(8):     1,
        bin(9):     1,
        bin(10):    1,
        bin(11):    1,
        bin(12):    1,
        bin(13):    1,
        bin(14):    1,
        bin(15):    1,
        bin(16):    1,
        bin(17):    1,
        bin(18):    1
    }
    func_unit = {
        'ADD':      1,
        'SUB':      1,
        'MUL':      1,
        'FADD':     1,
        'FSUB':     1,
        'FMUL':     1,
        'AND':      1,
        'OR':       1,
        'NAND':     1,
        'NOR':      1,
        'XOR':      1,
        'XNOR':     1,
        'NOT':      1,
        'NEG':      1,
        'LDR':      1,
        'STR':      1
    }
    reg_file = {
        bin(0):     -1,
        bin(1):     -1,
        bin(2):     -1,
        bin(3):     -1,
        bin(4):     -1,
        bin(5):     -1,
        bin(6):     -1,
        bin(7):     -1,
        bin(8):     -1,
        bin(9):     -1,
        bin(10):    -1,
        bin(11):    -1,
        bin(12):    -1,
        bin(13):    -1,
        bin(14):    -1,
        bin(15):    -1,
        bin(16):    -1,
        bin(17):    -1,
        bin(18):    -1,
        bin(19):    -1,
        bin(20):    -1,
        bin(21):    -1,
        bin(22):    -1,
        bin(23):    -1,
        bin(24):    -1,
        bin(25):    -1,
        bin(26):    -1,
        bin(27):    -1,
        bin(28):    -1,
        bin(29):    -1,
        bin(30):    -1,
        bin(31):    -1
    }
    n_packed_instr = 0
    total_lines = 0
    line_index = 0
    # contains registers used(write lock), time realeased
    matrix = []
    code = []
    time = 0
    def __init__(self, code, n_packed_instr= 4, time= 0):
        self.time = time
        self.n_packed_instr = n_packed_instr
        self.code = code
        self.total_lines = len(code)
        self.line_of_code = 0

    def add_entry(self, line_index):
        instr = self.code[line_index][0]
        reg1 = self.code[line_index][1]
        reg2 = self.code[line_index][2]
        reg3 = self.code[line_index][3]
        reg4 = self.code[line_index][4]
        exec_time = self.instr_exec_time[instr] + self.time
        self.matrix.append((reg1, 'w', exec_time))
        self.matrix.append((reg2, 'r', exec_time))
        self.matrix.append((reg3, 'r', exec_time))
        if instr == 'MUL':
            self.matrix.append((reg4, 'w', exec_time))

    def update_matrix(self):
        for reg, dependency_type, completion_time in self.matrix:
            if self.time == completion_time:
                pass

    def is_schedulable(self, code_line):
        self.update_matrix()
        dest_reg = code_line[0]
        src_reg1 = code_line[1]        
        src_reg2 = code_line[2]        
        src_reg3 = code_line[3]        
        

    def schedule(self, line_index):
        for i in range(self.n_packed_instr):
            if self.is_schedulable(self.code[line_index + i]):
                self.add_entry(line_index + i)
            pass

    def __del__(self):
        del self
