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

module xor_gate_using_mux
(
    input  a,
    input  b,
    output o
);
  wire constant_0 = 1'b0;
  wire constant_1 = 1'b1;
  wire not_b;
  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  mux mux_not_b(
    .d0(constant_1),
    .d1(constant_0),
    .sel(b),
    .y(not_b)
  );

  mux and_gate(
    .d0(b),
    .d1(not_b),
    .sel(a),
    .y(o)
  );

endmodule
