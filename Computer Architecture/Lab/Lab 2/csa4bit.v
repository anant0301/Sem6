`include "csa1bit.v"
module csa4bit(
	input [3:0] in1, 
	input [3:0] in2, 
	input [3:0] in3, 
	output [3:0] sum, 
	output [3:0] carry
);
csa1bit csa0(in1[0], in2[0], in3[0], sum[0], carry[0]);
csa1bit csa1(in1[1], in2[1], in3[1], sum[1], carry[1]);
csa1bit csa2(in1[2], in2[2], in3[2], sum[2], carry[2]);
csa1bit csa3(in1[3], in2[3], in3[3], sum[3], carry[3]);

	
endmodule

