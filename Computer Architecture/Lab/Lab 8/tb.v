`include "fl_mul32.v"
module tb;

    reg [31:0] in0, in1;
    output [31:0] product;
    reg clk;

    fl_mul32 block(
        in0[31:0], in1[31:0], clk, product
    );

    initial begin
        forever begin
            #1
            clk = ~clk;
        end
    end

    initial 
    begin
        clk = 1;
        in0[31:0] = 32'h40000000;
        in1[31:0] = 32'h40000000;
        #21
        in0[31:0] = 32'h41000000;
        in1[31:0] = 32'h41000000;
        #21
        in0[31:0] = 32'hc1f00000;
        #21
        $finish;
    end

    initial begin
        $monitor($time, " in0 = %h, in1 = %h, product = %h", in0, in1, product);
    end

endmodule