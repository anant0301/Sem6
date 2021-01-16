`include"and16_1.v"
module and64_1(
	input [63:0] in1,
	input in2,
	output [63:0] out
);
	and16_1 a0(in1[15:0], in2, out[15:0]);
	and16_1 a1(in1[31:16], in2, out[31:16]);
	and16_1 a2(in1[47:32], in2, out[47:32]);
	and16_1 a3(in1[63:48], in2, out[63:48]);
endmodule

