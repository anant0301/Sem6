module level4(
	input [127:0] out_level3,
	output [127:0] cout
);
	kgp_sum4 eq0(8'h00, out_level3[7:0], cout[7:0]);
	kgp_sum4 eq1(8'h00, out_level3[15:8], cout[15:8]);
	
	kgp_sum16 sum1(out_level3[31:0], out_level3[31+16:0+16], cout[31+16 :0+16]);
	kgp_sum16 sum2(out_level3[63:32], out_level3[63+16:32+16], cout[63+16 :32+16]);
	kgp_sum16 sum3(out_level3[95:64], out_level3[95+16:64+16], cout[95+16 :64+16]);
	
	kgp_sum4 sum4(out_level3[103:96], out_level3[103+16:96+16], cout[103+16:96+16]);
	kgp_sum4 sum5(out_level3[111:104], out_level3[111+16:104+16], cout[111+16:104+16]);
	
endmodule
