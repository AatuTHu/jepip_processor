//instruction pointer ~ program counter

module ip (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] next_instr,
    output reg  [31:0] current_instr
);

  always @(posedge clk) begin
    if (rst) begin
      current_instr <= 32'b0; 
    end else begin
      current_instr <= next_instr;
    end
  end

endmodule

