`include "fl_adder32.v"

module tb();

    reg [31:0] a;
    reg [31:0] b;
    output [31:0] sum;
    reg clk;
    fl_adder32 f1(
        a, 
        b,
        clk,
        sum
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
        a = 32'h3f800000;
        b = {1'b0, 8'hff, 23'h0};
        
        #10
        b = 32'hbf800000;
        #10
        a = 32'h3f000000;
        b = 32'h3f000000;
        #10
        $finish;
    end

    initial 
	begin;
		$monitor($time, " in1= %h, in2= %h, sum= %h", a, b, sum);
	end

endmodule