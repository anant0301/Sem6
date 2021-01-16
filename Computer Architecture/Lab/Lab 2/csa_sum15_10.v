module csa_sum15_10(
	input [63:0] in0,
	input [63:0] in1,
	input [63:0] in2,
	input [63:0] in3,
	input [63:0] in4,
	input [63:0] in5,
	input [63:0] in6,
	input [63:0] in7,
	input [63:0] in8,
	input [63:0] in9,
	input [63:0] in10,
	input [63:0] in11,
	input [63:0] in12,
	input [63:0] in13,
	input [63:0] in14,
	output [63:0] out0,
	output [63:0] out1,
	output [63:0] out2,
	output [63:0] out3,
	output [63:0] out4,
	output [63:0] out5,
	output [63:0] out6,
	output [63:0] out7,
	output [63:0] out8,
	output [63:0] out9
	);
	csa64bit csa0(in0[63:0], in1[63:0], in2[63:0], out0[63:0], out1[63:0]);
	csa64bit csa1(in3[63:0], in4[63:0], in5[63:0], out2[63:0], out3[63:0]);
	csa64bit csa2(in6[63:0], in7[63:0], in8[63:0], out4[63:0], out5[63:0]);
	csa64bit csa3(in9[63:0], in10[63:0], in11[63:0], out6[63:0], out7[63:0]);
	csa64bit csa4(in12[63:0], in13[63:0], in14[63:0], out8[63:0], out9[63:0]);
	
endmodule
