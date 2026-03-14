module sign_selection(
	input [11:0] aX2_magnitude,
	input [7:0] bX_magnitude,
	input [3:0] c_magnitude,
	input S1,S2,S3,
	output [12:0] aX2_signed, 
	output [12:0] bX_signed, 
	output [12:0] c_signed

);


// Extended to 13-bit
wire [12:0] aX2_13bit = {1'b0, aX2_magnitude};
wire [12:0] bX_13bit = {5'b00000, bX_magnitude};
wire [12:0] c_13bit = {9'b000000000, c_magnitude};
wire [12:0] aX2_negative, bX_negative, c_negative;


// 2's Complement of the magnitude
twos_comp comp1(aX2_13bit, aX2_negative);
twos_comp comp2(bX_13bit, bX_negative);
twos_comp comp3(c_13bit, c_negative);


// multiplexer to choose which input to use + or - 
mux2to1 mux1(S1,aX2_13bit,aX2_negative, aX2_signed);
mux2to1 mux2(S2,bX_13bit,bX_negative, bX_signed);
mux2to1 mux3(S3,c_13bit,c_negative, c_signed);

endmodule 