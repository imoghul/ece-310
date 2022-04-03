module overlapping(
	input rst_n,clock,ser_in,
	input [3:0] pattern,
	output found
);

	wire [3:0] current;
	wire patternFound;
	wire dead;
	shift_reg overlapping_shiftReg (
		.rst_n(rst_n),
		.clock(clock),
		.clr(0),
		.ser_in(ser_in),
		.reset_value(0),
		.clear_value(0),
		.value(current)
	);
	
	assign patternFound = current[0]==pattern[3] && current[1]==pattern[2] && current[2]==pattern[1] && current[3]==pattern[0];

	dff u1 (rst_n,clock,patternFound,found,dead);

endmodule
