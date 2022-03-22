module lab6_seq_1101(
	input rst_n,clock,d_in,
	output found
);
	reg [2:0] sv;
	assign found = sv==4;
	always @ (posedge clock) begin
		if(!rst_n)
			sv <= 0;
		else begin
			if(sv==0)
				if(d_in==0) sv <= 0;
				else sv <= 1;
			else if(sv==1)
				if(d_in==0) sv <= 0;
                                else sv <= 2;
			else if(sv==2)
                                if(d_in==0) sv <= 3;
                                else sv <= 2;
			else if(sv==3)
                                if(d_in==0) sv <= 0;
                                else sv <= 4;
			else if(sv==4)
                                if(d_in==0) sv <= 0;
                                else sv <= 2;
		end
	end
endmodule
