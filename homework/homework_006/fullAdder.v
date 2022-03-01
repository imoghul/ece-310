module fullAdder (
  input Cin, A, B,
  output Cout, Sum
);
	assign {Cout,Sum} = Cin+A+B;

endmodule
