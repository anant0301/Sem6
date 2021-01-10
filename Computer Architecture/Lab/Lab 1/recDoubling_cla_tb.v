`include"RD_CLA.v"

module recDoubling_cla_tb;
	reg [31:0]in1;
	reg [31:0]in2;
	reg cin;
	output cout;
	output [31:0]sum;

	RD_CLA block_1(in1, in2, cin, sum, cout);

	initial 
	begin
		in1 = 32'h000030;
		cin = 0;
		in2 = 32'h000050;
		#10
		in1 = 32'h8;
		
	end

	initial 
	begin;
		$monitor($time, " in1= %h, in2= %h, sum= %h", in1, in2, sum);
	end
endmodule
