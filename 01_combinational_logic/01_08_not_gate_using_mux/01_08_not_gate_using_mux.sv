//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module not_gate_using_mux
(
    input  i,
    output o
);
  wire constant_0 = 1'b0;
  wire constant_1 = 1'b1;

  // Task:
  // Implement not gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  mux not_mux(
    .d0(constant_1),
    .d1(constant_0),
    .sel(i),
    .y(o)
  );

endmodule
