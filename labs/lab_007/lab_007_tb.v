module lab_007_tb;

  reg rst_n, clock;
  wire last;
  reg [31:0] size;
  reg size_valid,data_start;
  // will be our shift register

  size_count DUT (
    .rst_n( rst_n ),
    .clock( clock ),
    .size( size),
    .size_valid( size_valid ),
    .data_start( data_start ),
    .last( last )
  );

  // free-running clock
  initial clock = 0;
  always #5 clock = ~clock;

  // active low synchronous reset
  initial begin
        rst_n = 0;
    #10 rst_n = 1;
    #10 size = 5;
    #10 size_valid = 1;
    #10 data_start = 1;
  end
  
  // this controls how long the testbench runs; it's
  // designed to tell the simulation to stop once 400
  // units of time have passed
  //   I settled on this number because the clock
  // periods are 10 units and there are 32 bits in the
  // shift register that are shifted out ... and then
  // a few extra
  initial
    #400 $stop;

  // this is a parallel in serial out shift register
  // that is loaded with stimulus on the reset.  the
  // value loaded is a 32-bit quantity that represents
  // the string that we want to send from left to
  // right (that way it's easy to see the pattern in
  // the string).  note that the output to the DUT is
  // taken from the left bit
  //   the shift is to shift left and bring in a 0 at
  // the least significant bit

endmodule
