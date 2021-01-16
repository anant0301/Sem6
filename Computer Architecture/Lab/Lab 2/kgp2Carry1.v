module kgp2Carry1(
	input [1:0] in,
	input prev_carry,
	output  cout
);
	//always@(in) begin
		assign cout = in[0];
	//end	
endmodule
