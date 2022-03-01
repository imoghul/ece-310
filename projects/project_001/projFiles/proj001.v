module proj001(
	input rst_n, clock, capture,
	input [1:0]  op,
	input [3:0] d_in,
	output [4:0] result,
	output valid
);
	wire [3:0] Aout, Bout, Cout, Dout;
	wire [3:0] Acap, Bcap, Ccap, Dcap;
	dff_4bit A ( rst_n, clock, op==0 && capture == 1 ? d_in : Aout, Aout );	
	dff_4bit B ( rst_n, clock, op==1 && capture == 1 ? d_in : Bout, Bout );
	dff_4bit C ( rst_n, clock, op==2 && capture == 1 ? d_in : Cout, Cout );
	dff_4bit D ( rst_n, clock, op==3 && capture == 1 ? d_in : Dout, Dout );
	assign valid = Acap && Bcap && Ccap && Dcap;		
	dff_4bit Ac (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==0 && capture == 1) || Acap==1)? 4'b0001 : 4'b0000), Acap);
	dff_4bit Bc (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==1 && capture == 1) || Bcap==1)? 4'b0001 : 4'b0000), Bcap);
	dff_4bit Cc (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==2 && capture == 1) || Ccap==1)? 4'b0001 : 4'b0000), Ccap);
	dff_4bit Dc (rst_n, clock, (valid == 1) ? 4'b0000 : (((op==3 && capture == 1) || Dcap==1)? 4'b0001 : 4'b0000), Dcap);

	calculator F ( Aout, Bout, Cout, Dout, result );
endmodule
