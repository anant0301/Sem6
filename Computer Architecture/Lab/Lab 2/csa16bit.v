`include "csa4bit.v"
module csa16bit(
	input [15:0] in1, 
	input [15:0] in2, 
	input [15:0] in3, 
	output [15:0] sum, 
	output [15:0] carry
);
csa4bit csa0(in1[3:0], in2[3:0], in3[3:0], sum[3:0], carry[3:0]);
csa4bit csa1(in1[7:4], in2[7:4], in3[7:4], sum[7:4], carry[7:4]);
csa4bit csa2(in1[11:8], in2[11:8], in3[11:8], sum[11:8], carry[11:8]);
csa4bit csa3(in1[15:12], in2[15:12], in3[15:12], sum[15:12], carry[15:12]);
endmodule
