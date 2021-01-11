`include "fl_adder_32bit.v"

module fl_adder_32_tb();

    reg [31:0] a;
    reg [31:0] b;
    output [31:0] sum;

    fl_adder_32bit f1(
        a, 
        b,
        sum
    );

    initial 
    begin
        a = 32'h3f800000;
        b = {1'b0, 8'hff, 23'h0};
        #5 
        b = 32'hbf800000;
        #5 
        a = 32'hc0000000;
        b = 32'hbf800000;
        #5 
        a = 32'h41f00000;
        b = 32'h41f00000;
        #5 
        a = 32'hc1f00000;
        #5 
        a = 32'h42f00000;
        b = 32'h41f00000;
        #5 
        a = 32'h42f10000;
        b = 32'h41f10000;

    end

    initial 
	begin;
		$monitor($time, " in1= %h, in2= %h, sum= %h", a, b, sum);
	end

endmodule