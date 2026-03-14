module mul4in8(
	input [7:0] a,
	input [3:0] b,
	output[11:0] p

);


wire [7:0] b0,b1,b2,b3;

assign b0 = {8{b[0]}} & a[7:0]; 
assign b1 = {8{b[1]}} & a[7:0]; 
assign b2 = {8{b[2]}} & a[7:0]; 
assign b3 = {8{b[3]}} & a[7:0]; 


wire [7:0] sum1, sum2, sum3;
wire cout1, cout2, cout3;


// Eight bit adder 1
eight_bit_adder FBA0({1'b0, b0[7:1]},{b1[7:0]},1'b0, sum1, cout1);

// Eight bit adder 2
eight_bit_adder FBA1({cout1, sum1[7:1]},{b2[7:0]},1'b0, sum2, cout2);


// Eight bit adder 3
eight_bit_adder FBA2({cout2, sum2[7:1]},{b3[7:0]},1'b0, sum3, cout3);


assign p[0]= b0[0];
assign p[1]= sum1[0];
assign p[2]= sum2[0];
assign p[10:3]= sum3[7:0];
assign p[11]= cout3;

endmodule 