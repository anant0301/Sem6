`include "csa_sum30_20.v"
`include "csa_sum21_14.v"
`include "csa_sum15_10.v"
`include "csa_sum9_6.v"
`include "csa_sum6_4.v"
`include "csa64bit.v"
module add_phase(
	input [63:0] in0,
	input [63:0] in1,
	input [63:0] in2,
	input [63:0] in3,
	input [63:0] in4,
	input [63:0] in5,
	input [63:0] in6,
	input [63:0] in7,
	input [63:0] in8,
	input [63:0] in9,
	input [63:0] in10,
	input [63:0] in11,
	input [63:0] in12,
	input [63:0] in13,
	input [63:0] in14,
	input [63:0] in15,
	input [63:0] in16,
	input [63:0] in17,
	input [63:0] in18,
	input [63:0] in19,
	input [63:0] in20,
	input [63:0] in21,
	input [63:0] in22,
	input [63:0] in23,
	input [63:0] in24,
	input [63:0] in25,
	input [63:0] in26,
	input [63:0] in27,
	input [63:0] in28,
	input [63:0] in29,
	input [63:0] in30,
	input [63:0] in31,
	output [63:0] sum,
	output [63:0] carry
);

//32 -- 22 -- 15 -- 10 -- 7 -- 5 -- 4 -- 3 -- 2

	wire [63:0] level_1_out0;
	wire [63:0] level_1_out1;
	wire [63:0] level_1_out2;
	wire [63:0] level_1_out3;
	wire [63:0] level_1_out4;
	wire [63:0] level_1_out5;
	wire [63:0] level_1_out6;
	wire [63:0] level_1_out7;
	wire [63:0] level_1_out8;
	wire [63:0] level_1_out9;
	wire [63:0] level_1_out10;
	wire [63:0] level_1_out11;
	wire [63:0] level_1_out12;
	wire [63:0] level_1_out13;
	wire [63:0] level_1_out14;
	wire [63:0] level_1_out15;
	wire [63:0] level_1_out16;
	wire [63:0] level_1_out17;
	wire [63:0] level_1_out18;
	wire [63:0] level_1_out19;
	csa_sum30_20 level1(
		in0,	in1,	in2, 
		in3,	in4,	in5, 
		in6,	in7,	in8, 
		in9,	in10,	in11, 
		in12,	in13,	in14, 
		in15,	in16,	in17, 
		in18,	in19,	in20,
		in21,	in22,	in23, 
		in24,	in25,	in26, 
		in27,	in28,	in29,
		level_1_out0,	level_1_out1,
		level_1_out2,	level_1_out3,
		level_1_out4,	level_1_out5,
		level_1_out6,	level_1_out7,
		level_1_out8,	level_1_out9,
		level_1_out10,	level_1_out11,
		level_1_out12,	level_1_out13,
		level_1_out14,	level_1_out15,
		level_1_out16,	level_1_out17,
		level_1_out18,	level_1_out19
	);
	
	wire [63:0] level_2_out0;
	wire [63:0] level_2_out1;
	wire [63:0] level_2_out2;
	wire [63:0] level_2_out3;
	wire [63:0] level_2_out4;
	wire [63:0] level_2_out5;
	wire [63:0] level_2_out6;
	wire [63:0] level_2_out7;
	wire [63:0] level_2_out8;
	wire [63:0] level_2_out9;
	wire [63:0] level_2_out10;
	wire [63:0] level_2_out11;
	wire [63:0] level_2_out12;
	wire [63:0] level_2_out13;
	// in30, in31 left 
	csa_sum21_14 level2(
		level_1_out0,	level_1_out1,	level_1_out2,
		level_1_out3,	level_1_out4,	level_1_out5,
		level_1_out6,	level_1_out7,	level_1_out8,
		level_1_out9,	level_1_out10,	level_1_out11,
		level_1_out12,	level_1_out13,	level_1_out14, 
		level_1_out15,	level_1_out16,	level_1_out17,
		level_1_out18,	level_1_out19,	in30,
		level_2_out0,	level_2_out1,
		level_2_out2,	level_2_out3,
		level_2_out4,	level_2_out5,
		level_2_out6,	level_2_out7,
		level_2_out8,	level_2_out9,
		level_2_out10,	level_2_out11,
		level_2_out12,	level_2_out13
	);
	
	wire [63:0] level_3_out0;
	wire [63:0] level_3_out1;
	wire [63:0] level_3_out2;
	wire [63:0] level_3_out3;
	wire [63:0] level_3_out4;
	wire [63:0] level_3_out5;
	wire [63:0] level_3_out6;
	wire [63:0] level_3_out7;
	wire [63:0] level_3_out8;
	wire [63:0] level_3_out9;
	// in31 left 
	csa_sum15_10 level3(
		level_2_out0,	level_2_out1,	level_2_out2,
		level_2_out3,	level_2_out4,	level_2_out5,
		level_2_out6,	level_2_out7,	level_2_out8,
		level_2_out9,	level_2_out10,	level_2_out11,
		level_2_out12,	level_2_out13,	in31,
		level_3_out0,	level_3_out1,
		level_3_out2,	level_3_out3,
		level_3_out4,	level_3_out5,
		level_3_out6,	level_3_out7,
		level_3_out8,	level_3_out9
	);
	wire [63:0] level_4_out0;
	wire [63:0] level_4_out1;
	wire [63:0] level_4_out2;
	wire [63:0] level_4_out3;
	wire [63:0] level_4_out4;
	wire [63:0] level_4_out5;
	// level_3_out9 left
	csa_sum9_6 level4(
		level_3_out0, level_3_out1,	level_3_out2,
		level_3_out3, level_3_out4, level_3_out5,
		level_3_out6, level_3_out7,	level_3_out8,
		level_4_out0, level_4_out1,
		level_4_out2, level_4_out3,
		level_4_out4, level_4_out5
	);
	wire [63:0] level_5_out0;
	wire [63:0] level_5_out1;
	wire [63:0] level_5_out2;
	wire [63:0] level_5_out3;
	// level_3_out9 left
	csa_sum6_4 level5	(
		level_4_out0, level_4_out1,	level_4_out2,
		level_4_out3, level_4_out4, level_4_out5,
		level_5_out0, level_5_out1,
		level_5_out2, level_5_out3
	);
	
	// inputs left level_3_out9, level_5_out3
	wire [63:0] level_6_out0;
	wire [63:0] level_6_out1;
	csa64bit level6(
		level_5_out0, level_5_out1, level_5_out2, 
		level_6_out0, level_6_out1
	);
	
	wire [63:0] level_7_out0;
	wire [63:0] level_7_out1;
	// inputs left level_3_out9
	csa64bit level7(
		level_6_out0, level_6_out1, level_3_out9, 
		level_7_out0, level_7_out1
	);
	csa64bit level8(
		level_7_out0, level_7_out1, level_5_out3,
		sum, carry
	);
	
endmodule
