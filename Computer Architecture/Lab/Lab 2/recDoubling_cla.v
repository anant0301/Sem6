`include"level1.v"
`include"level2.v"
`include"level3.v"
`include"level4.v"
`include"level5.v"
`include "kgp_16.v"
`include"getCarry.v"
module recDoubling_cla(
	input [63:0] in1,
	input [63:0] in2,
	input cin,
	output[63:0] sum
);
	wire [63:0] xorsum;
	assign xorsum = in1 ^in2;

	wire [127:0] out_level1;
	level1 l1(in1, in2, out_level1);

	wire [127:0] out_level2;
	level2 l2(out_level1, out_level2);
	
	wire [127:0] out_level3;
	level3 l3(out_level2, out_level3);
	
	wire [127:0] out_level4;
	level4 l4(out_level3, out_level4);
	
	wire [127:0] out_level5;
	level4 l5(out_level4, out_level5);
	
	wire [127:0] out_level6;
	level4 l6(out_level5, out_level6);
	
	wire [63:0] cout;
	getCarry l7(out_level5[63:0], cin, cout[31:0]);
	getCarry l8(out_level5[127:64], cout[31], cout[63:32]);
	assign sum = xorsum ^ cout;
		
//	always @(sum) begin
//		$display("cout= %b\nin1 = %b\nin2 = %b\nsum = %b\n", cout, in1, in2,sum);
//	end
endmodule
