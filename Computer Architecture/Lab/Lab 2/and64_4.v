`include"and64_1.v"
module and64_4(
	input [63:0] in1,
	input [3:0] in2,
	output [63:0] out0,
	output [63:0] out1,
	output [63:0] out2,
	output [63:0] out3
	
);
	and64_1 a0(
		in1[63:0], 
		in2[0], 
		out0[63:0]
		);
	and64_1 a1(
		in1[63:0], 
		in2[1], 
		out1[63:0]
		);
	and64_1 a2(
		in1[63:0], 
		in2[2], 
		out2[63:0]
		);
	and64_1 a3(
		in1[63:0], 
		in2[3], 
		out3[63:0]
		);
endmodule

