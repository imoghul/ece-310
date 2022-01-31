module lab_002_partb (
  input A,
  input B,
  input C,
  output F
);

  /* put your variable declarations here */
  
  wire aNotB, abc, notA;
  not U1 (notA, A);
  and U2 (aNotB, notA,B);
  and U3 (abc, A,B,C);
  or U4 (F, aNotB, abc);

  /* put your gate instances here */

endmodule
