module csa_sum6_4(
	input [63:0] in0,
	input [63:0] in1,
	input [63:0] in2,
	input [63:0] in3,
	input [63:0] in4,
	input [63:0] in5,
	output [63:0] out0,
	output [63:0] out1,
	output [63:0] out2,
	output [63:0] out3
	);
	csa64bit csa0(in0[63:0], in1[63:0], in2[63:0], out0[63:0], out1[63:0]);
	csa64bit csa1(in3[63:0], in4[63:0], in5[63:0], out2[63:0], out3[63:0]);
endmodule
