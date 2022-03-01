module fiveBitAdder (
  input [4:0] A, B,
  output [4:0] F
);

  wire w1, w2,w3,w4, overflow;
  wire Cin_tied;

  assign Cin_tied = 1'b0;

  fullAdder U1 ( Cin_tied, A[0], B[0], w1, F[0] );
  fullAdder U2 ( w1, A[1], B[1], w2, F[1] );
  fullAdder U3 ( w2, A[2], B[2], w3, F[2] );
  fullAdder U4 ( w3, A[3], B[3], w4, F[3] );
  fullAdder U5 ( w4, A[4], B[4], overflow, F[4] );

endmodule
