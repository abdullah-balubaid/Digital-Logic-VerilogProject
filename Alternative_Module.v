module multiplier4in4_alternative(
	input [3:0] a, b,
	output[7:0] p
);


wire [3:0] b0,b1,b2,b3;
wire c10,c11,c12,c13,c20,c21,c22,c23,c30,c31,c32,c33;
wire s10,s11,s12,s13,s20,s21,s22,s23,s30,s31,s32,s33;

assign b0 = {4{b[0]}} & a[3:0];
assign b1 = {4{b[1]}} & a[3:0];
assign b2 = {4{b[2]}} & a[3:0];
assign b3 = {4{b[3]}} & a[3:0];


// Adders
half_adder HA0(b0[1],b1[0],s10,c10);
full_adder FA0(b0[2],b1[1],c10,s11,c11);
full_adder FA1(b0[3],b1[2],c11,s12,c12);
half_adder HA1(b1[3],c12,s13,c13);
half_adder HA2(b2[0],s11,s20,c20);
full_adder FA2(b2[1],s12,c20,s21,c21);
full_adder FA3(b2[2],s13,c21,s22,c22);
full_adder FA4(b2[3],c13,c22,s23,c23);
half_adder HA3(b3[0],s21,s30,c30);
full_adder FA5(b3[1],s22,c30,s31,c31);
full_adder FA6(b3[2],s23,c31,s32,c32);
full_adder FA7(b3[3],c23,c32,s33,c33);


assign p[0] = b0[0];
assign p[1] = s10;
assign p[2] = s20;
assign p[3] = s30;
assign p[4] = s31;
assign p[5] = s32;
assign p[6] = s33;
assign p[7] = c33;


endmodule 


