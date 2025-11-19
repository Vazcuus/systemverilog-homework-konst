//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module round_robin_arbiter_with_2_requests
(
    input        clk,
    input        rst,
    input  [1:0] requests,
    output [1:0] grants
);
    // Task:
    // Implement a "arbiter" module that accepts up to two requests
    // and grants one of them to operate in a round-robin manner.
    //
    // The module should maintain an internal register
    // to keep track of which requester is next in line for a grant.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // requests -> 01 00 10 11 11 00 11 00 11 11
    // grants   -> 01 00 10 01 10 00 01 00 10 01

    logic priority_is_on_1;
    logic [1:0] grants_reg;

    always_comb begin
        case (requests)
            2'b00: grants_reg = 2'b00;
            2'b01: grants_reg = 2'b01;
            2'b10: grants_reg = 2'b10;
            2'b11: begin
                if (priority_is_on_1) begin
                    grants_reg = 2'b10;
                end
                else begin
                    grants_reg = 2'b01;
                end
            end
        endcase
    end

    always_ff @ (posedge clk, posedge rst)
        if (rst)
            priority_is_on_1 <= 1'b1;
        else begin
        if (grants_reg == 2'b01)
            priority_is_on_1 <= 1'b1;
        else if (grants_reg == 2'b10)
            priority_is_on_1 <= 1'b0;
        end

    assign grants = grants_reg;

endmodule
