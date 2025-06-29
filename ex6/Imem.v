module Imem(
  input         clock,
  input         io_valid, // @[src/main/scala/npc/pmemio.scala 54:14]
  input  [31:0] io_raddr, // @[src/main/scala/npc/pmemio.scala 54:14]
  output [31:0] io_rdata // @[src/main/scala/npc/pmemio.scala 54:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:255]; // @[src/main/scala/npc/pmemio.scala 57:24]
  wire  mem_io_rdata_MPORT_en; // @[src/main/scala/npc/pmemio.scala 57:24]
  wire [7:0] mem_io_rdata_MPORT_addr; // @[src/main/scala/npc/pmemio.scala 57:24]
  wire [31:0] mem_io_rdata_MPORT_data; // @[src/main/scala/npc/pmemio.scala 57:24]
  reg  mem_io_rdata_MPORT_en_pipe_0;
  reg [7:0] mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_en = mem_io_rdata_MPORT_en_pipe_0;
  assign mem_io_rdata_MPORT_addr = mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_data = mem[mem_io_rdata_MPORT_addr]; // @[src/main/scala/npc/pmemio.scala 57:24]
  assign io_rdata = io_valid ? mem_io_rdata_MPORT_data : 32'h0; // @[src/main/scala/npc/pmemio.scala 60:18 61:14 63:14]
  always @(posedge clock) begin
    mem_io_rdata_MPORT_en_pipe_0 <= io_valid;
    if (io_valid) begin
      mem_io_rdata_MPORT_addr_pipe_0 <= io_raddr[7:0];
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdata_MPORT_addr_pipe_0 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
