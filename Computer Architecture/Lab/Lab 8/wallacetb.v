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
        clk = 1;
        num1 = 7;
        num2 = 15;
        #24
        num1 = 324;
        num2 = 31;
        #24
        num1 = 3;
        num2 = 3;
        #24
        $finish;
    end

    initial begin
        $monitor($time, " num1 = %d, num2 = %d, product = %d", num1, num2, product);	
    end

endmodule