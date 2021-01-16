`include "kgp_4.v"
module kgp_16(
	input [15:0] in1, 
	input [15:0] in2, 
	output[31:0] value
);

kgp_4 b1(in1[3:0], in2[3:0], value[7:0]);
kgp_4 b2(in1[7:4], in2[7:4], value[15:8]);
kgp_4 b3(in1[11:8], in2[11:8], value[23:16]);
kgp_4 b4(in1[15:12], in2[15:12], value[31:24]);
endmodule
