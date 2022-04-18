module adler32_acc (
  input         rst_n, clk, en,
  input  [ 7:0] data,
  output [31:0] checksum
);

  reg  [15:0] A, B;
  wire [15:0] modulo_add_A, modulo_add_B,deadA,deadB;
  // checksum output
  assign checksum = { B, A };

  // A register
  always @( posedge clk )
    if( !rst_n )
      A <= 1;
    else begin
      A <= en?modulo_add_A:1;
    end
  // B register
  always @( posedge clk )
    if( !rst_n )
      B <= 0;
    else begin
      B <= en?modulo_add_B:0;
    end
  modulo_sum sum_A (
   A, {8'h00, data}, modulo_add_A);

  modulo_sum sum_B (
   B, modulo_add_A, modulo_add_B);

endmodule

module modulo_sum(
  input      [15:0] a, b,
  output reg [15:0] sum
);

  reg [16:0] tmp_sum;

  always @( a, b ) begin
	tmp_sum = a + b;
    	if( tmp_sum >= 65521 )
      		sum = tmp_sum - 65521;
    	else
      		sum = tmp_sum;
  end

endmodule
