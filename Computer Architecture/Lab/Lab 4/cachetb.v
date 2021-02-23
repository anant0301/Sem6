`include "mem_cache.v"

module cachetb;

    reg read;
    reg write;
    reg clk;
    reg [15:0] readAddr;
    reg [15:0] writeAddr;
    reg [31:0] writeData;
    output [31:0] readData;

    mem_cache block(
        read, write, clk,
        writeAddr, readAddr,
        writeData,
        readData
    );

    initial begin
        forever begin
            #1
            clk = ~clk;
        end
    end

    initial
    begin
        #0
        clk             = 1;
        read            = 1;
        write           = 0;
        readAddr        = 0;
        writeAddr       = 0;
        #5
        read            = 0;
        write           = 1;
        writeData       = 31'hffff;
        #5
        readAddr        = 0;
        read            = 1;
        write           = 0;
        #5
        $finish;
    end
    initial 
    begin
        $monitor($time, " read= %h, write= %h, readAddr= %h, writeAddr= %h, writeData= %h, readData= %h", read, write, readAddr, writeAddr, writeData, readData /*[31:0]*/);
    end
endmodule