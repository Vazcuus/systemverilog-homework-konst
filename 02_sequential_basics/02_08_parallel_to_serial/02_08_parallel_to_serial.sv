module parallel_to_serial
#(
    parameter width = 8
)
(
    input                      clk,
    input                      rst,

    input                      parallel_valid,
    input      [width - 1:0]   parallel_data,

    output                     busy,
    output                     serial_valid,
    output                     serial_data
);


    logic [width - 1:0] data_reg;
    logic [$clog2(width):0] bit_counter; 
    logic busy_reg;


    assign busy = busy_reg;
    assign serial_valid = busy_reg;
    assign serial_data = data_reg[0]; 

    always_ff @(posedge clk, posedge rst)
    begin
        if (rst) 
        begin
            busy_reg    <= 1'b0;
            data_reg    <= '0;
            bit_counter <= '0;
        end
        else 
        begin
            if (parallel_valid && !busy_reg) 
            begin
                busy_reg    <= 1'b1;
                data_reg    <= parallel_data; 
                bit_counter <= '0;             
            end
            else if (busy_reg) 
            begin
                data_reg    <= data_reg >> 1;   
                bit_counter <= bit_counter + 1;

                if (bit_counter == width - 1) 
                begin
                    busy_reg <= 1'b0; 
                end
            end
        end
    end

endmodule