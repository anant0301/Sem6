`include "wallace32.v"
module wallacetb;

    reg [31:0] num1, num2;
    output [63:0] product;
    reg clk;
    wallace32 block(
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
        #20
        num1 = 324;
        num2 = 31;
        #20
        num1 = 3;
        num2 = 3;
        #20
        $finish;
    end

    initial begin
        $monitor($time, " num1 = %d, num2 = %d, product = %d", num1, num2, product[62:0]);	
    end

endmodule