`include "kgp_sum16.v"
module level1(
	input [63:0] in1,
	input [63:0] in2,
	output [127:0] cout
);
	wire [127:0] value;
	kgp_16 b1(in1[15:0], in2[15:0], value[31:0]);
	kgp_16 b2(in1[31:16], in2[31:16], value[63:32]);
	kgp_16 b3(in1[47:32], in2[47:32], value[95:64]);
	kgp_16 b4(in1[63:48], in2[63:48], value[127:96]);
		
	kgp_sum1 eq0(2'b00, value[1:0], cout[1:0]);

	kgp_sum16 sum1(value[31:0], value[31+2:0+2], cout[31+2 :0+2]);
	kgp_sum16 sum2(value[63:32], value[63+2:32+2], cout[63+2 :32+2]);
	kgp_sum16 sum3(value[95:64], value[95+2:64+2], cout[95+2 :64+2]);
	
	kgp_sum4 sum4(value[103:96], value[103+2:96+2], cout[103+2:96+2]);
	kgp_sum4 sum5(value[111:104], value[111+2:104+2], cout[111+2:104+2]);
	kgp_sum4 sum6(value[119:112], value[119+2:112+2], cout[119+2:112+2]);
	
	kgp_sum1 sum7(value[121:120], value[121+2:120+2], cout[121+2:120+2]);
	kgp_sum1 sum8(value[123:122], value[123+2:122+2], cout[123+2:122+2]);
	kgp_sum1 sum9(value[125:124], value[125+2:124+2], cout[125+2:124+2]);

endmodule
