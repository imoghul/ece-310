module hw6_q1b(
	input [3:0] A,B,C,D,
	output [4:0] F
);

	wire [4:0] ApB, CpD, invCpD; 
	wire [5:0] negCpD;
	fourBitAdder u1(A,B,ApB);
	fourBitAdder u2(C,D,CpD);
	assign invCpD = ~CpD;
	fiveBitAdder u3(invCpD, 5'b00001, negCpD[4:0]);
	fiveBitAdder u4(negCpD[4:0],ApB,F);	

endmodule
