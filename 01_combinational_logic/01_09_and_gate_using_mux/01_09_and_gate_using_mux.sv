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

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);
  wire constant_0 = 1'b0;

  // Task:
  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  mux and_gate(
    .d0(constant_0),
    .d1(b),
    .sel(a),
    .y(o)
  );
endmodule
