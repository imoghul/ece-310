module proj001(
	input rst_n, clock, capture,
	input [1:0]  op,
	input [3:0] d_in,
	output [4:0] result,
	output valid
);
	wire [3:0] Aout, Bout, Cout, Dout;
	wire [3:0] Acap, Bcap, Ccap, Dcap;
	wire op0,op1,op2,op3,nop_0,nop_1;
	not u1(nop_0,op[0]);
	not u2(nop_1,op[1]);
	and u3(op0,nop_0,nop_1);
	and u4(op1,nop_0,op[1]);
	and u5(op2,op[0],nop_1);
	and u6(op3,op[0],op[1]);
	wire Aen,Ben,Cen,Den;
	and u7(Aen,op0,capture);
	and u8(Ben,op1,capture);
	and u9(Cen,op2,capture);
	and u10(Den,op3,capture);
	wire [3:0] Areg,Breg,Creg,Dreg;
	mux21_4bit u11(Aen,Aout,d_in,Areg);
	mux21_4bit u12(Ben,Bout,d_in,Breg);
	mux21_4bit u13(Cen,Cout,d_in,Creg);
	mux21_4bit u14(Den,Dout,d_in,Dreg);
	dff_4bit A ( rst_n, clock, Areg, Aout );	
	dff_4bit B ( rst_n, clock, Breg, Bout );
	dff_4bit C ( rst_n, clock, Creg, Cout );
	dff_4bit D ( rst_n, clock, Dreg, Dout );
	assign valid = Acap && Bcap && Ccap && Dcap;		
	/*wire [3:0] Alev1, Blev1,Clev1,Dlev1, Alev2, Blev2, Clev2,Dlev2;
	mux21_4bit u15(valid, Alev2, 4'b0000,Alev1);
	mux21_4bit u15(valid, Blev2, 4'b0000,Blev1); 
	mux21_4bit u15(valid, Blev2, 4'b0000,Blev1); 
	mux21_4bit u15(valid, Blev2, 4'b0000,Blev1);*/ 	
	dff_4bit Ac (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==0 && capture == 1) || Acap==1)? 4'b0001 : 4'b0000), Acap);
	dff_4bit Bc (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==1 && capture == 1) || Bcap==1)? 4'b0001 : 4'b0000), Bcap);
	dff_4bit Cc (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==2 && capture == 1) || Ccap==1)? 4'b0001 : 4'b0000), Ccap);
	dff_4bit Dc (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==3 && capture == 1) || Dcap==1)? 4'b0001 : 4'b0000), Dcap);

	calculator F ( Aout, Bout, Cout, Dout, result );
endmodule
