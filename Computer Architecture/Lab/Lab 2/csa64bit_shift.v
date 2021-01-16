`include "csa16bit.v"
module csa64bit_shift(
	input [63:0] in1, 
	input [63:0] in2, 
	input [63:0] in3, 
	output [63:0] sum, 
	output [63:0] carry
);
csa16bit csa0(in1[15:0], in2[15:0], in3[15:0], sum[15:0], carry[15:0]);
csa16bit csa1(in1[31:16], in2[31:16], in3[31:16], sum[31:16], carry[31:16]);
csa16bit csa2(in1[47:32], in2[47:32], in3[47:32], sum[47:32], carry[47:32]);
csa16bit csa3(in1[63:48], in2[63:48], in3[63:48], sum[63:48], carry[63:48]);

endmodule
