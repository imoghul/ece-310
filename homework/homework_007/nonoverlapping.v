module nonoverlapping(
	input rst_n,clock,ser_in,
	input [3:0] pattern,
	output found
);

	wire [3:0] current;
	wire patternFound;
	wire dead;
	shift_reg nonoverlapping_shiftReg (
		.rst_n(rst_n),
		.clock(clock),
		.clr(patternFound),
		.ser_in(ser_in),
		.reset_value(pattern%2?4'b0000:4'b1111),
		.clear_value(pattern%2?3'b000:3'b111),
		.value(current)
	);
	
	assign patternFound = current[0]==pattern[3] && current[1]==pattern[2] && current[2]==pattern[1] && current[3]==pattern[0];

	dff u1 (rst_n,clock,patternFound,found,dead);

endmodule
