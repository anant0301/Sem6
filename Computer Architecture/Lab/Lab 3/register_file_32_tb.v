`include "register_file_32.v"
module register_file_32_tb;

    reg [4:0] sel1;
    reg [4:0] sel2;
    reg [4:0] sel_write;
    reg clk;
    reg [31:0] data_write;
    output [31:0] data_read1;
    output [31:0] data_read2;
    reg read_sel = 1;
    reg write_sel = 1;

    register_file_32 reg_file (
        sel1,
        sel2,
        sel_write,
        data_write,
        clk,
        read_sel,
        write_sel,
        data_read1,
        data_read2
    );
    initial begin
    clk = 0;
    forever 	
        #5 clk =~clk;
    end
    integer i = 0;
    initial 
    begin
        for (i = 0 ; i < 32; ++i) 
        begin
            #5
            #5 
            sel1 = i;
            sel2 = 32 - i - 1;
            data_write = i * i;
            sel_write = i;

        end
        $finish;
    end

    initial 
    begin
        $monitor ($time, " clk= %b\n sel1= %d, sel2= %d, sel_write= %d, data_write= %d, data_read1= %d, data_read2= %d", clk, sel1, sel2, sel_write, data_write, data_read1, data_read2);    
    end

endmodule