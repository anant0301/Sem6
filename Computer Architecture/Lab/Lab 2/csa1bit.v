module csa1bit(
	input a, 
	input b, 
	input c, 
	output sum, 
	output carry
);
	wire w1, w2, w3;
	xor xor1(w1, b, c);
	xor xor2(sum, w1, a);
	
	and and1(w2, w1, a);
	and and2(w3, b, c);
	or or1(carry, w3, w2);
	
endmodule
