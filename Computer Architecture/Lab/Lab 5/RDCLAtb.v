`include"RDCLA32.v"

module RDCLAtb;
	reg [31:0]in1;
	reg [31:0]in2;
	reg cin;
	reg clk;
	output cout;
	output [31:0]sum;

	RDCLA32 block_1(in1, in2, cin, clk, cout, sum);
	initial begin
		forever 
		begin
			#1 
			clk = ~clk;
		end
	end

	initial 
	begin
		clk = 1'b1;
		in1 = 33;
		cin = 0;
		in2 = 12;
		#14
		in1 = 3;
		cin = 0;
		in2 = 12;
		#14
		in1 = 13;
		cin = 0;
		in2 = 12;
		#14
		in1 = 113;
		cin = 0;
		in2 = 121;
		#14
		$finish;
		
	end

	initial 
	begin
		$monitor($time, " in1= %d, in2= %d, sum= %d", in1, in2, sum);
	end
endmodule
