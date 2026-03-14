module mux2to1(
	input S, 
	input [12:0]A0, 
	input [12:0]A1,
	output[12:0] y
);


// Selection Inverter
wire notS;
not(notS, S);


// Loop on each selection
genvar i;
generate
	for (i = 0; i < 13; i = i + 1) begin : mux_loop
		wire S0, S1;
		and (S0, notS, A0[i]);
		and (S1, S, A1[i]);
		or (y[i], S0, S1);
		end
	endgenerate
	
endmodule 