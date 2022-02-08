//`include "lab_003_parta.v"
//`include "lab_003_partb.v"
module lab_003_partc (
  input A, B, C, D,
  output F
);
wire connect_G;
lab_003_parta parta (A,B,C,connect_G);
lab_003_partb partb (connect_G,D,F);
endmodule
