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
    n_packed_instr = 0
    total_lines = 0
    line_index = 0
    # contains registers used(write lock), time realeased  
    matrix = []
    code = []
    time = 0
    def __init__(self, code, n_packed_instr, time):
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
        exec_time = self.instr_exec_time[instr]
        self.matrix.append((reg1, 'w', exec_time))
        self.matrix.append((reg2, 'r', exec_time))
        self.matrix.append((reg3, 'r', exec_time))
        if instr == 'MUL':
            self.matrix.append((reg4, 'w', exec_time))

    def update_matrix(self):
        for reg, dependecny_type, completion_time in self.matrix:
            pass

    def is_schedulable(self, code_line):
        self.update_matrix()
        pass

    def schedule(self, line_index):
        for i in range(self.n_packed_instr):
            if self.is_schedulable(self.code[line_index + i]):
                self.add_entry(line_index + i)
            pass

    def __del__(self):
        del self