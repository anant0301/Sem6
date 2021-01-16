module level5(
	input [127:0] out_level4,
	output [127:0] cout
);
	kgp_sum16 eq0(32'h00000000, out_level4[31:0], cout[31:0]);
	
	kgp_sum16 sum1(out_level4[31:0], out_level4[31+32:0+32], cout[31+32 :0+32]);
	kgp_sum16 sum2(out_level4[63:32], out_level4[63+32:32+32], cout[63+32 :32+32]);
	kgp_sum16 sum3(out_level4[95:64], out_level4[95+32:64+32], cout[95+32 :64+32]);
	
endmodule
