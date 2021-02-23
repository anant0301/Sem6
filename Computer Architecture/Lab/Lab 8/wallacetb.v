`include "mul24.v"
module wallacetb;

    reg [23:0] num1, num2;
    output [47:0] product;
    reg clk;
    mul24 block(
        num1, num2, clk, product
    );
    initial begin
        forever begin
            #1
            clk = ~clk;
        end
    end

    initial 
    begin
        clk     = 1;
        num1    = 23'hf0000;
        num2    = 23'hf0000;
        #24
        num1    = 23'h80000;
        num2    = 23'h80000;
        #24
        num1    = 23'h20000;
        num2    = 23'h20000;
        #24
        $finish;
    end

    initial begin
        $monitor($time, " num1 = %d, num2 = %d, product = %d", num1, num2, product);	
    end

endmodule