//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_4_1_width_2
(
  input  [1:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [1:0] y
);

  assign y = sel [1] ? (sel [0] ? d3 : d2)
                     : (sel [0] ? d1 : d0);

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 with 4-bit data
  // using two instances of mux_4_1_width_2 with 2-bit data
  wire[1:0] d0_low =  d0[1:0];
  wire[1:0] d0_high = d0[3:2];

  wire[1:0] d1_low =  d1[1:0];
  wire[1:0] d1_high = d1[3:2];

  wire[1:0] d2_low =  d2[1:0]; 
  wire[1:0] d2_high = d2[3:2];

  wire[1:0] d3_low =  d3[1:0]; 
  wire[1:0] d3_high = d3[3:2];

  wire[1:0] y_low;
  wire[1:0] y_high;

  mux_4_1_width_2 stage_low(
    .d0(d0_low),
    .d1(d1_low),
    .d2(d2_low),
    .d3(d3_low),
    .sel(sel),
    .y(y_low)
  );


  mux_4_1_width_2 stage_high(
    .d0(d0_high),
    .d1(d1_high),
    .d2(d2_high),
    .d3(d3_high),
    .sel(sel),
    .y(y_high)
  );

assign y = {y_high, y_low};


endmodule
