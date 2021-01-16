module level3(
	input [127:0] out_level2,
	output [127:0] cout
);
	kgp_sum4 eq0(8'h00, out_level2[7:0], cout[7:0]);
	
	kgp_sum16 sum1(out_level2[31:0], out_level2[31+8:0+8], cout[31+8 :0+8]);
	kgp_sum16 sum2(out_level2[63:32], out_level2[63+8:32+8], cout[63+8 :32+8]);
	kgp_sum16 sum3(out_level2[95:64], out_level2[95+8:64+8], cout[95+8 :64+8]);
	
	kgp_sum4 sum4(out_level2[103:96], out_level2[103+8:96+8], cout[103+8:96+8]);
	kgp_sum4 sum5(out_level2[111:104], out_level2[111+8:104+8], cout[111+8:104+8]);
	kgp_sum4 sum6(out_level2[119:112], out_level2[119+8:112+8], cout[119+8:112+8]);	
	
endmodule
