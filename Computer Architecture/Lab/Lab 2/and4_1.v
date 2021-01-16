module and4_1(
	input [3:0] in1,
	input in2,
	output [3:0] out
);
	and a0(out[0], in1[0], in2);
	and a1(out[1], in1[1], in2);
	and a2(out[2], in1[2], in2);
	and a3(out[3], in1[3], in2);
	
endmodule

