`include"and4_1.v"
module and16_1(
	input [15:0] in1,
	input in2,
	output [15:0] out
);
	and4_1 a0(in1[3:0], in2, out[3:0]);
	and4_1 a1(in1[7:4], in2, out[7:4]);
	and4_1 a2(in1[11:8], in2, out[11:8]);
	and4_1 a3(in1[15:12], in2, out[15:12]);
endmodule

