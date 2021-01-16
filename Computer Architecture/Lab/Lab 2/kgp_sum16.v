`include"kgp_sum4.v"
module kgp_sum16(
	input [31:0]in1,
	input [31:0]in2,
	output [31:0] out
);
	kgp_sum4 b1(in1[7:0], in2[7:0], out[7:0]);
	kgp_sum4 b2(in1[15:8], in2[15:8], out[15:8]);
	kgp_sum4 b3(in1[23:16], in2[23:16], out[23:16]);
	kgp_sum4 b4(in1[31:24], in2[31:24], out[31:24]);

endmodule

