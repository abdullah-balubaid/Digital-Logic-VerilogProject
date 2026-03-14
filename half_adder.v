module half_adder(
	input A,
	input B,
	
	output sum,
	output carry
);


xor s(sum, A,B);
and c(carry, A,B);

endmodule 