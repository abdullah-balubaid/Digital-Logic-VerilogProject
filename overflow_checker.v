module overflow_checker(
	input Sa,Sb,Sc,
	output overflow

);

wire not_Sa, not_Sb, not_Sc;
not (not_Sa, Sa);
not (not_Sb, Sb);
not (not_Sc, Sc);

and(case1,not_Sa,not_Sb,Sc);
and(case2,Sa,Sb,not_Sc);
or(overflow,case1,case2);

endmodule 