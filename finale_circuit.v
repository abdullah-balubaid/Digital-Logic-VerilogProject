module finale_circuit(
	input [3:0] a,b,c,X,
	input S1,S2,S3,
	output[12:0]F,
	output ovf
);

wire [7:0] X2_magnitude,bX_magnitude;
wire [11:0] aX2_magnitude;
wire [12:0] aX2_signed, bX_signed, c_signed;
wire [12:0] sum_aX2_bX;
wire cout1, cout2;
wire ovf1, ovf2;

// Multiplier Modules
mul4in4 X2(X,X, X2_magnitude);
mul4in8 aX2(X2_magnitude, a, aX2_magnitude);
mul4in4 bX(b,X,bX_magnitude);


// Sign Selection Modules
sign_selection signs(aX2_magnitude, bX_magnitude, c, S1, S2, S3, aX2_signed, bX_signed, c_signed);


// Adder Modules + Overflow Checker
thirteen_bit_adder adder1(aX2_signed, bX_signed, 1'b0, sum_aX2_bX, cout1);
overflow_checker overflow1(aX2_signed[12],bX_signed[12],sum_aX2_bX[12],ovf1);

thirteen_bit_adder adder2(sum_aX2_bX, c_signed, 1'b0, F, cout2);
overflow_checker overflow2(sum_aX2_bX[12],c_signed[12],F[12],ovf2);

or overflow(ovf, ovf1,ovf2);

endmodule 