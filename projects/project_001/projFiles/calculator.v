module calculator(
	input [3:0] A,B,C,D,
	output [4:0] F
);

	wire [4:0] ApB, CpD, invCpD; 
	wire [5:0] negCpD;
	fourBitAdder u1(A,B,ApB);
	fourBitAdder u2(C,D,CpD);
	//assign invCpD = ~CpD;
	
	not(invCpD[0],CpD[0]);
	not(invCpD[1],CpD[1]);
	not(invCpD[2],CpD[2]);
	not(invCpD[3],CpD[3]);
	not(invCpD[4],CpD[4]);

	fiveBitAdder u3(invCpD, 5'b00001, negCpD[4:0]);
	fiveBitAdder u4(negCpD[4:0],ApB,F);	

endmodule
