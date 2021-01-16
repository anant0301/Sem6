`include"and64_4.v"
module and64_16(
	input [63:0] in1,
	input [15:0] in2,
	output [63:0] out0,
	output [63:0] out1,
	output [63:0] out2,
	output [63:0] out3,
	output [63:0] out4,
	output [63:0] out5,
	output [63:0] out6,
	output [63:0] out7,
	output [63:0] out8,
	output [63:0] out9,
	output [63:0] out10,
	output [63:0] out11,
	output [63:0] out12,
	output [63:0] out13,
	output [63:0] out14,
	output [63:0] out15
	
);
	and64_4 a0(
		in1[63:0], 
		in2[3:0], 
		out0[63:0],
		out1[63:0],
		out2[63:0],
		out3[63:0]
		);
	and64_4 a1(
		in1[63:0], 
		in2[7:4], 
		out4[63:0],
		out5[63:0],
		out6[63:0],
		out7[63:0]
		);
	and64_4 a2(
		in1[63:0], 
		in2[11:8], 
		out8[63:0],
		out9[63:0],
		out10[63:0],
		out11[63:0]		
		);
	and64_4 a3(
		in1[63:0], 
		in2[15:12], 
		out12[63:0],
		out13[63:0],
		out14[63:0],
		out15[63:0]
		);
endmodule

