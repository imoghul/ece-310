module lab6_seq_101(
	input rst_n,clock,d_in,
	output found
);
	reg [1:0] sv;
	assign found = sv==3;
	always @ (posedge clock) begin
		if(!rst_n)
			sv <= 0;
		else begin
			if(sv==0)
				if(d_in==0) sv <= 0;
				else sv <= 1;
			else if(sv==1)
				if(d_in==0) sv <= 2;
                                else sv <= 1;
			else if(sv==2)
                                if(d_in==0) sv <= 0;
                                else sv <= 3;
			else if(sv==3)
                                if(d_in==0) sv <= 0;
                                else sv <= 1;
		end
	end
endmodule
