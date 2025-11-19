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

module or_gate_using_mux
(
    input  a,
    input  b,
    output o
);
  wire constant_1 = 1'b1;

  // Task:
  // Implement or gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  mux or_gate(
    .d0(b),
    .d1(constant_1),
    .sel(a),
    .y(o)
  );

endmodule
