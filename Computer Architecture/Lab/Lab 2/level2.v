module level2(
	input [127:0] out_level1,
	output [127:0] cout
);
	kgp_sum1 eq0(2'b00, out_level1[1:0], cout[1:0]);
	kgp_sum1 eq1(2'b00, out_level1[3:2], cout[3:2]);
	
	
	kgp_sum16 sum1(out_level1[31:0], out_level1[31+4:0+4], cout[31+4 :0+4]);
	kgp_sum16 sum2(out_level1[63:32], out_level1[63+4:32+4], cout[63+4 :32+4]);
	kgp_sum16 sum3(out_level1[95:64], out_level1[95+4:64+4], cout[95+4 :64+4]);
	
	kgp_sum4 sum4(out_level1[103:96], out_level1[103+4:96+4], cout[103+4:96+4]);
	kgp_sum4 sum5(out_level1[111:104], out_level1[111+4:104+4], cout[111+4:104+4]);
	kgp_sum4 sum6(out_level1[119:112], out_level1[119+4:112+4], cout[119+4:112+4]);
	
	kgp_sum1 sum7(out_level1[121:120], out_level1[121+4:120+4], cout[121+4:120+4]);
	kgp_sum1 sum8(out_level1[123:122], out_level1[123+4:122+4], cout[123+4:122+4]);
endmodule
