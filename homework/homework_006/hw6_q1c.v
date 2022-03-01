module hw6_q1c;

	reg [3:0] A,B,C,D;
        wire [4:0] F;
	
	hw6_q1b ADDER(A,B,C,D,F);

        initial begin 
	        $display( $time, ": ( A +  B) - ( C +  D) =  F");
	        $display( $time, ": -------------+------------" );
	        $monitor( $time, ": (%2d + %2d) - (%2d + %2d) = %2d", A,B,C,D,F);
        end
	initial begin
                { A, B, C,D } = 16'b1011_1100_1001_0111; 
	    #10 { A, B,C,D } = 16'b1110_1110_1101_1011;
	    #10 { A, B ,C,D} = 16'b1110_1000_0000_1000;
	    #10 { A, B, C, D } = 16'b1111_1111_1001_1011;
	    #10 { A, B,C,D } = 16'b0101_1110_0001_0011;
    	    #10 $stop();
  	end
endmodule
