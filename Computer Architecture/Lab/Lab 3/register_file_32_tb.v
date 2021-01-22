`include "register_file_32.v"
module register_file_32_tb;

    reg [4:0] sel1;
    reg [4:0] sel2;
    reg [4:0] sel_write;
    reg clk;
    reg [31:0] data_write;
    output [31:0] data_read1;
    output [31:0] data_read2;

    register_file_32 reg_file (
        sel1,
        sel2,
        sel_write,
        data_write,
        clk,
        data_read1,
        data_read2
    );

    initial 
    begin
        sel1 = 12;
        sel2 = 24;
        clk = 0;
        data_write = 0;
        sel_write = 0;
        
        #5
        clk = 1;
        #5
        clk = 0;
        #5
        clk = 1;
       
        #5
        sel_write = 1;
        data_write = 1;
        #5
        sel1 = 10;
        sel2 = 21;
    end

    initial 
    begin
        $monitor ($time, " clk= %b\n sel1= %d, sel2= %d, sel_write= %d, data_write= %d, data_read1= %d, data_read2= %d", clk, sel1, sel2, sel_write, data_write, data_read1, data_read2);    
    end

endmodule