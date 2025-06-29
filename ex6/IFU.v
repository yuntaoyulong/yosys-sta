module IFU(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/npc/IFU.scala 24:16]
  input  [31:0] io_in_bits_dnpc, // @[src/main/scala/npc/IFU.scala 24:16]
  input         io_in_bits_redirect, // @[src/main/scala/npc/IFU.scala 24:16]
  output [31:0] io_out_bits_pc, // @[src/main/scala/npc/IFU.scala 24:16]
  output [31:0] io_out_bits_inst, // @[src/main/scala/npc/IFU.scala 24:16]
  output        io_imem_valid, // @[src/main/scala/npc/IFU.scala 24:16]
  output [31:0] io_imem_raddr, // @[src/main/scala/npc/IFU.scala 24:16]
  input  [31:0] io_imem_rdata // @[src/main/scala/npc/IFU.scala 24:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pcReg; // @[src/main/scala/npc/IFU.scala 31:24]
  wire  useRedirect = io_in_ready & io_in_bits_redirect; // @[src/main/scala/npc/IFU.scala 33:34]
  wire [31:0] _nextPc_T_1 = pcReg + 32'h4; // @[src/main/scala/npc/IFU.scala 36:47]
  reg  resetComplete; // @[src/main/scala/npc/IFU.scala 38:32]
  wire  _GEN_0 = ~resetComplete & ~reset | resetComplete; // @[src/main/scala/npc/IFU.scala 40:43 41:23 38:32]
  assign io_in_ready = 1'h1; // @[src/main/scala/npc/IFU.scala 27:17]
  assign io_out_bits_pc = pcReg; // @[src/main/scala/npc/IFU.scala 53:20]
  assign io_out_bits_inst = io_imem_rdata; // @[src/main/scala/npc/IFU.scala 54:22]
  assign io_imem_valid = resetComplete; // @[src/main/scala/npc/IFU.scala 45:19]
  assign io_imem_raddr = pcReg; // @[src/main/scala/npc/IFU.scala 46:19]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/npc/IFU.scala 31:24]
      pcReg <= 32'h80000000; // @[src/main/scala/npc/IFU.scala 31:24]
    end else if (useRedirect) begin // @[src/main/scala/npc/IFU.scala 36:21]
      pcReg <= io_in_bits_dnpc;
    end else begin
      pcReg <= _nextPc_T_1;
    end
    if (reset) begin // @[src/main/scala/npc/IFU.scala 38:32]
      resetComplete <= 1'h0; // @[src/main/scala/npc/IFU.scala 38:32]
    end else begin
      resetComplete <= _GEN_0;
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  resetComplete = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
