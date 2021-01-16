`include"kgp_sum1.v"
module kgp_sum4(
	input [7:0]in1,
	input [7:0]in2,
	output [7:0] out
);
	kgp_sum1 b1(in1[1:0], in2[1:0], out[1:0]);
	kgp_sum1 b2(in1[3:2], in2[3:2], out[3:2]);
	kgp_sum1 b3(in1[5:4], in2[5:4], out[5:4]);
	kgp_sum1 b4(in1[7:6], in2[7:6], out[7:6]);
endmodule
