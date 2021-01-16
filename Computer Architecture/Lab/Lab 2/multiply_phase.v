`include "and64_32.v"
module multiply_phase(
	input [31:0] in1,
	input [31:0] in2,
	output [63:0] out0,
	output [63:0] out1,
	output [63:0] out2,
	output [63:0] out3,
	output [63:0] out4,
	output [63:0] out5,
	output [63:0] out6,
	output [63:0] out7,
	output [63:0] out8,
	output [63:0] out9,
	output [63:0] out10,
	output [63:0] out11,
	output [63:0] out12,
	output [63:0] out13,
	output [63:0] out14,
	output [63:0] out15,
	output [63:0] out16,
	output [63:0] out17,
	output [63:0] out18,
	output [63:0] out19,
	output [63:0] out20,
	output [63:0] out21,
	output [63:0] out22,
	output [63:0] out23,
	output [63:0] out24,
	output [63:0] out25,
	output [63:0] out26,
	output [63:0] out27,
	output [63:0] out28,
	output [63:0] out29,
	output [63:0] out30,
	output [63:0] out31
	);
	wire [31:0] in_offset;
	wire [63:0] o0;
	wire [63:0] o1;
	wire [63:0] o2;
	wire [63:0] o3;
	wire [63:0] o4;
	wire [63:0] o5;
	wire [63:0] o6;
	wire [63:0] o7;
	wire [63:0] o8;
	wire [63:0] o9;
	wire [63:0] o10;
	wire [63:0] o11;
	wire [63:0] o12;
	wire [63:0] o13;
	wire [63:0] o14;
	wire [63:0] o15;
	wire [63:0] o16;
	wire [63:0] o17;
	wire [63:0] o18;
	wire [63:0] o19;
	wire [63:0] o20;
	wire [63:0] o21;
	wire [63:0] o22;
	wire [63:0] o23;
	wire [63:0] o24;
	wire [63:0] o25;
	wire [63:0] o26;
	wire [63:0] o27;
	wire [63:0] o28;
	wire [63:0] o29;
	wire [63:0] o30;
	wire [63:0] o31;
	assign in_offset = 64'd0;
	and64_32 a0(
		{in_offset[31:0], in1[31:0]}, 
		in2[31:0], 
		o0[63:0],
		o1[63:0],
		o2[63:0],
		o3[63:0],
		o4[63:0],
		o5[63:0],
		o6[63:0],
		o7[63:0],
		o8[63:0],
		o9[63:0],
		o10[63:0],
		o11[63:0],
		o12[63:0],
		o13[63:0],
		o14[63:0],
		o15[63:0],
		o16[63:0],
		o17[63:0],
		o18[63:0],
		o19[63:0],
		o20[63:0],
		o21[63:0],
		o22[63:0],
		o23[63:0],
		o24[63:0],
		o25[63:0],
		o26[63:0],
		o27[63:0],
		o28[63:0],
		o29[63:0],
		o30[63:0],
		o31[63:0]
		);		
	assign out0[63:0] = o0[63:0] << 0;
	assign out1[63:0] = o1[63:0] << 1;
	assign out2[63:0] = o2[63:0] << 2;
	assign out3[63:0] = o3[63:0] << 3;
	assign out4[63:0] = o4[63:0] << 4;
	assign out5[63:0] = o5[63:0] << 5;
	assign out6[63:0] = o6[63:0] << 6;
	assign out7[63:0] = o7[63:0] << 7;
	assign out8[63:0] = o8[63:0] << 8;
	assign out9[63:0] = o9[63:0] << 9;
	assign out10[63:0] = o10[63:0] << 10;
	assign out11[63:0] = o11[63:0] << 11;
	assign out12[63:0] = o12[63:0] << 12;
	assign out13[63:0] = o13[63:0] << 13;
	assign out14[63:0] = o14[63:0] << 14;
	assign out15[63:0] = o15[63:0] << 15;
	assign out16[63:0] = o16[63:0] << 16;
	assign out17[63:0] = o17[63:0] << 17;
	assign out18[63:0] = o18[63:0] << 18;
	assign out19[63:0] = o19[63:0] << 19;
	assign out20[63:0] = o20[63:0] << 20;
	assign out21[63:0] = o21[63:0] << 21;
	assign out22[63:0] = o22[63:0] << 22;
	assign out23[63:0] = o23[63:0] << 23;
	assign out24[63:0] = o24[63:0] << 24;
	assign out25[63:0] = o25[63:0] << 25;
	assign out26[63:0] = o26[63:0] << 26;
	assign out27[63:0] = o27[63:0] << 27;
	assign out28[63:0] = o28[63:0] << 28;
	assign out29[63:0] = o29[63:0] << 29;
	assign out30[63:0] = o30[63:0] << 30;
	assign out31[63:0] = o31[63:0] << 31;
endmodule
