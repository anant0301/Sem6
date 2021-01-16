module level5(
	input [127:0] out_level5,
	output [127:0] cout
);
	kgp_sum16 eq0(32'h00000000, out_level5[31:0], cout[31:0]);
	kgp_sum16 eq1(32'h00000000, out_level5[63:32], cout[63:32]);
	
	kgp_sum16 sum1(out_level5[31:0], out_level5[31+64:0+64], cout[31+64 :0+64]);
	kgp_sum16 sum2(out_level5[63:32], out_level5[63+64:32+64], cout[63+64 :32+64]);
	
endmodule
