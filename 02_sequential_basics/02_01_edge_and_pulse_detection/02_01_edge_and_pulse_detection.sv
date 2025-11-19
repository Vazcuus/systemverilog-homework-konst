//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (input clk, rst, a, output detected);

  // Task:
  // Create an one cycle pulse (010) detector.
  //
  // Note:
  // See the testbench for the output format ($display task).

  typedef enum logic [1:0] {
      IDLE,
      GOT_0,
      GOT_01
  } state_t;

  state_t current_state, next_state;
  always_comb begin
    next_state = IDLE;
    case (current_state)
      IDLE:
        if (a == 1'b0) next_state = GOT_0;
        else           next_state = IDLE;
      GOT_0:
        if (a == 1'b1) next_state = GOT_01;
        else           next_state = GOT_0;
      GOT_01:
        if (a == 1'b0) next_state = GOT_0;
        else           next_state = IDLE;
    endcase
  end

  always_ff @ (posedge clk) begin
    if (rst)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  assign detected = (current_state == GOT_01) && (a == 1'b0);
endmodule
