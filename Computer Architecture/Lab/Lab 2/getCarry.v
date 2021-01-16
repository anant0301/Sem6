`include "kgp32Carry16.v"
module getCarry(
	input [63:0]kgp,
	input cin,
	output [31:0] cout
);
		kgp32Carry16 b1(kgp[31:0], cin, cout[15:0]);
		kgp32Carry16 b2(kgp[63:32], cin, cout[31:16]);
endmodule
