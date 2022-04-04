module tb;

  reg rst_n, clock;
  wire found;
  reg in;
  reg [3:0] pattern;
  reg p_load;
  reg overlap;
  reg o_load;

  sequence_detector DUT (
    .rst_n( rst_n ),
    .clock( clock ),
    .ser_in ( in ),
    .pattern (pattern),
    .p_load (p_load),
    .overlap (overlap),
    .o_load (o_load),
    .found( found )
  );

  // free-running clock
  initial clock = 0;
  always #5 clock = ~clock;

  initial begin
        {rst_n,in,pattern,p_load,overlap,o_load} = {9'b0_1_1010_1_0_1};
    #5 {rst_n,in} = {2'b11};
    #10 {rst_n,in,p_load,o_load} = {4'b11_00};
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 {in,o_load,overlap,p_load,pattern} = 8'b1111_0101;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
  end
  
  initial
    #200 $stop;


endmodule
