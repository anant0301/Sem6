`include "kgp_1.v"
module kgp_4(
	input [3:0] in1, 
	input [3:0] in2, 
	output[7:0] value
);

kgp_1 b1(in1[0], in2[0], value[1:0]);
kgp_1 b2(in1[1], in2[1], value[3:2]);
kgp_1 b3(in1[2], in2[2], value[5:4]);
kgp_1 b4(in1[3], in2[3], value[7:6]);
endmodule
