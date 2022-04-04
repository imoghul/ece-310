module nonoverlapping(
	input rst_n,clock,ser_in,
	input [3:0] pattern,
	output found
);

	wire [3:0] current;
	shift_reg nonoverlapping_shiftReg (
		.rst_n(rst_n),
		.clock(clock),
		.clr(found),
		.ser_in(ser_in),
		.reset_value({4{!pattern[0]}}),
		.clear_value({3{!pattern[0]}}),
		.value(current)
	);
	
	assign found = current[0]==pattern[3] && current[1]==pattern[2] && current[2]==pattern[1] && current[3]==pattern[0];


endmodule
