`include"add_phase.v"
`include"multiply_phase.v"
`include"recDoubling_cla.v"
module wallace_tree32bit(
	input [31:0] in1,
	input [31:0] in2,
	output [63:0] out
);
	wire [63:0] mul_phase_out0;
	wire [63:0] mul_phase_out1;
	wire [63:0] mul_phase_out2;
	wire [63:0] mul_phase_out3;
	wire [63:0] mul_phase_out4;
	wire [63:0] mul_phase_out5;
	wire [63:0] mul_phase_out6;
	wire [63:0] mul_phase_out7;
	wire [63:0] mul_phase_out8;
	wire [63:0] mul_phase_out9;
	wire [63:0] mul_phase_out10;
	wire [63:0] mul_phase_out11;
	wire [63:0] mul_phase_out12;
	wire [63:0] mul_phase_out13;
	wire [63:0] mul_phase_out14;
	wire [63:0] mul_phase_out15;
	wire [63:0] mul_phase_out16;
	wire [63:0] mul_phase_out17;
	wire [63:0] mul_phase_out18;
	wire [63:0] mul_phase_out19;
	wire [63:0] mul_phase_out20;
	wire [63:0] mul_phase_out21;
	wire [63:0] mul_phase_out22;
	wire [63:0] mul_phase_out23;
	wire [63:0] mul_phase_out24;
	wire [63:0] mul_phase_out25;
	wire [63:0] mul_phase_out26;
	wire [63:0] mul_phase_out27;
	wire [63:0] mul_phase_out28;
	wire [63:0] mul_phase_out29;
	wire [63:0] mul_phase_out30;
	wire [63:0] mul_phase_out31;
	multiply_phase block1(
		in1,
		in2,
		mul_phase_out0, 
		mul_phase_out1,
		mul_phase_out2, 
		mul_phase_out3,
		mul_phase_out4, 
		mul_phase_out5,
		mul_phase_out6, 
		mul_phase_out7,
		mul_phase_out8, 
		mul_phase_out9,
		mul_phase_out10, 
		mul_phase_out11,
		mul_phase_out12, 
		mul_phase_out13,
		mul_phase_out14, 
		mul_phase_out15,
		mul_phase_out16, 
		mul_phase_out17,
		mul_phase_out18, 
		mul_phase_out19,
		mul_phase_out20,
		mul_phase_out21,
		mul_phase_out22, 
		mul_phase_out23,
		mul_phase_out24, 
		mul_phase_out25,
		mul_phase_out26, 
		mul_phase_out27,
		mul_phase_out28, 
		mul_phase_out29,
		mul_phase_out30, 
		mul_phase_out31
	);
	wire [63:0] sum;
	wire [63:0] carry;
	add_phase block2(
		mul_phase_out0, 
		mul_phase_out1,
		mul_phase_out2, 
		mul_phase_out3,
		mul_phase_out4, 
		mul_phase_out5,
		mul_phase_out6, 
		mul_phase_out7,
		mul_phase_out8, 
		mul_phase_out9,
		mul_phase_out10, 
		mul_phase_out11,
		mul_phase_out12, 
		mul_phase_out13,
		mul_phase_out14, 
		mul_phase_out15,
		mul_phase_out16, 
		mul_phase_out17,
		mul_phase_out18, 
		mul_phase_out19,
		mul_phase_out20,
		mul_phase_out21,
		mul_phase_out22, 
		mul_phase_out23,
		mul_phase_out24, 
		mul_phase_out25,
		mul_phase_out26, 
		mul_phase_out27,
		mul_phase_out28, 
		mul_phase_out29,
		mul_phase_out30, 
		mul_phase_out31,
		sum,
		carry
	);
	
	recDoubling_cla block3(
	sum,
	carry,
	1'b0,
	out
);		
endmodule
