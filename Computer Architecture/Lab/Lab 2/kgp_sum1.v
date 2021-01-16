module kgp_sum1(
	input [1:0] in1,
	input [1:0] in2,
	output reg [1:0] cout 
);
	always@(in1, in2) begin
		if (in1 == 2'b00 || in1 == 2'b11)
			assign cout = in1;
		else
			assign cout = in2;

	end	
endmodule

