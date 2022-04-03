module sequence_detector(
	input rst_n,clock,ser_in,p_load,overlap,o_load,
	input [3:0] pattern,
	output found
);

	wire[3:0] patternRequested,patternToFind,overlapRequested,overlapToFind;

	/*always @ (p_load) begin
                if(p_load) patternRequested = pattern;
		else patternRequested = patternToFind;
        end*/

	assign patternRequested = p_load?pattern:patternToFind;

	dff_4bit u2(rst_n,clock,patternRequested,patternToFind);


        /*always @ (o_load) begin
                if(o_load) overlapRequested = overlap;
                else overlapRequested = overlapToFind;
        end*/
	assign overlapRequested = o_load?overlap:overlapToFind;

        dff_4bit u4(rst_n,clock,overlapRequested,overlapToFind);

	
	wire found_overlap,found_nonoverlap;

	overlapping u3 (rst_n,clock,ser_in,patternToFind,found_overlap);
	nonoverlapping u5 (rst_n,clock,ser_in,patternToFind,found_nonoverlap);

	assign found = overlap?found_overlap:found_nonoverlap;

endmodule
