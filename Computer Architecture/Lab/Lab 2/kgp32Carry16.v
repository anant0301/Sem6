`include "kgp8Carry4.v"
module kgp32Carry16(
	input [31:0] in,
	input prev_carry,
	output [15:0] cout
);

kgp8Carry4 b1(in[7:0], prev_carry, cout[3:0]);
kgp8Carry4 b2(in[15:8], cout[3], cout[7:4]);
kgp8Carry4 b3(in[23:16], cout[7], cout[11:8]);
kgp8Carry4 b4(in[31:24], cout[11], cout[15:12]);
endmodule
