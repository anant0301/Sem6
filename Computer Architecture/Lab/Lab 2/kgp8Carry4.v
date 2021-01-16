`include "kgp2Carry1.v"
module kgp8Carry4(
	input [7:0] in,
	input prev_carry,
	output [3:0] cout
);

kgp2Carry1 b1(in[1:0], prev_carry, cout[0]);
kgp2Carry1 b2(in[3:2], cout[0], cout[1]);
kgp2Carry1 b3(in[5:4], cout[1], cout[2]);
kgp2Carry1 b4(in[7:6], cout[2], cout[3]);

endmodule
