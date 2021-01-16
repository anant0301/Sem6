`include "csa64bit_shift.v"
module csa64bit(
	input [63:0] in1, 
	input [63:0] in2, 
	input [63:0] in3, 
	output [63:0] sum, 
	output [63:0] carry
);
wire [63:0] carry_shift;
csa64bit_shift csa0(in1, in2, in3, sum, carry_shift);

assign carry = carry_shift << 1;
endmodule
