module shift_reg(
	input rst_n, clock, clr, ser_in,
	input [3:0] reset_value,
	input [2:0] clear_value,
	output [3:0] value
);

	reg [3:0] Q;
	always @ (posedge clock) begin
		if(!rst_n) Q <= reset_value;
		else if(clr) Q <= {ser_in,clear_value};
		else Q <= {ser_in,Q[3:1]}; 
	end
	assign value = Q;

endmodule
