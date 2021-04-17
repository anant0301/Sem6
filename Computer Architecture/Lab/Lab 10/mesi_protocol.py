class Processor(object):
    """
    Things of interest in a processer
    1. the state of various data
    2. transition of states of data 
    """

    data = []
    length = int(-1)

    def __init__(self, state, id, data= None, length):
        self.id =  id
        self.data = data
        self.length = length

    def add_data(self, addr, state):
        self.data[addr] = state

    def local_read_miss(self, dataid, processor_list):
        if self.data[dataid] in "MES":
            return self.data[dataid]
        else:
            for valid, processor in processor_list:
                if valid < 2 and processor.local_read_miss(dataid, processor_list) == "I":
                    
                    pass

        pass