module kgp_1(
	input in1,
	input in2,
	output [1:0] cout 
);
	assign cout = {in1, in2};
	
endmodule

