module csa_sum9_6(
	input [63:0] in0,
	input [63:0] in1,
	input [63:0] in2,
	input [63:0] in3,
	input [63:0] in4,
	input [63:0] in5,
	input [63:0] in6,
	input [63:0] in7,
	input [63:0] in8,
	output [63:0] out0,
	output [63:0] out1,
	output [63:0] out2,
	output [63:0] out3,
	output [63:0] out4,
	output [63:0] out5
	);
	csa64bit csa0(in0[63:0], in1[63:0], in2[63:0], out0[63:0], out1[63:0]);
	csa64bit csa1(in3[63:0], in4[63:0], in5[63:0], out2[63:0], out3[63:0]);
	csa64bit csa2(in6[63:0], in7[63:0], in8[63:0], out4[63:0], out5[63:0]);
endmodule
