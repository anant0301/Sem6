`include "mem_cache.v"

module cachetb;

    reg read;
    reg write;
    reg clk;
    reg [15:0] addr;
    reg [31:0] writeData;
    output [31:0] readData;

    mem_cache block1 (
        read, write, clk, addr,
        writeData, readData
    );
    initial begin
        forever begin
            #1
            clk = ~clk;
        end
    end
    // initial begin
    //     forever begin
    //         #8
    //         addr = addr + 1024;
    //     end
    // end
    initial
    begin
        #0
        clk         = 1;
        read        = 0;
        write       = 1;
        writeData   = 31'hffff;
        addr        = 16'h0;
        #4
        addr        = 16'h1;
        writeData   = 31'h1000;
        #4
        read        = 1;
        write       = 0;
        #4
        addr        = 16'h0;
        $finish;
    end
    initial 
    begin
        $monitor($time, " read= %h, write= %h, addr= %h, writeData= %h, readData= %h", read, write, addr, writeData, readData);
    end
endmodule