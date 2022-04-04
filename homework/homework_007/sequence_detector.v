module sequence_detector(
	input rst_n,clock,ser_in,p_load,overlap,o_load,
	input [3:0] pattern,
	output found
);

	wire[3:0] patternRequested,patternToFind,overlapRequested,overlapToFind;

	assign patternRequested = p_load?pattern:patternToFind;

	dff_4bit u2(rst_n,clock,patternRequested,patternToFind);

	assign overlapRequested = o_load?overlap:overlapToFind;

        dff_4bit u4(rst_n,clock,overlapRequested,overlapToFind);

	wire found_overlap,found_nonoverlap;

	overlapping u3 (rst_n,clock,ser_in,patternToFind,found_overlap);
	nonoverlapping u5 (rst_n,clock,ser_in,patternToFind,found_nonoverlap);

	assign found = overlap?found_overlap:found_nonoverlap;

endmodule
