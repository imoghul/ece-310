module adler32(
	input clock,rst_n,size_valid,data_start,
	input [31:0] size,
	input [7:0] data,
	output checksum_valid,
	output[31:0] checksum
);
	wire last;
	wire [31:0] curr;
	wire retrieving;
	size_count u1(clock,rst_n,size_valid,size+1,data_start,last,retrieving,curr);
	adler32_acc u2(rst_n,clock,retrieving,data,checksum);
	assign checksum_valid = last;

endmodule
