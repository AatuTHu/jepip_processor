//instruction memory fetcher

module instr_mem #(
    parameter PROGRAM_FILE = "../rom/program.hex"
) ( 
    input wire[31:0] ip,
    output wire[31:0] instr,
    output wire fetch_misaligned,
    output wire fetch_fault

);


  reg [31:0] mem[16383];
  integer i;

  initial begin
    for (i = 0; i < 16384; i = i + 1) mem[i] = 32'hFFFFFFFF;
    $readmemh(PROGRAM_FILE, mem);
  end

  assign instr            = mem[ip[15:2]];

  assign fetch_misaligned = (pc[1:0] != 2'b00);
  assign fetch_fault      = ~fetch_misaligned & (pc[31:16] != 16'h0000);

endmodule
