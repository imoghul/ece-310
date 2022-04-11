module adler32_acc (
	input clk,rst_n,
	input [7:0] data,
	output [31:0] checksum
);

	reg [15:0] A,B;
	assign checksum = {B,A};
	always @ (posedge clk)
		if(!rst_n) begin
			A <= 1;
			B <= 0;
		end
		else begin
			A = A+data;
			if(A>=65521) A = A-65521;
			B = B+A;
			if(B>=65521) B= B-65521;
		end

endmodule
