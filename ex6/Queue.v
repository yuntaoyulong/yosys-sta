module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_inst, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_inst // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_inst [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_inst_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_inst_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
  wire  empty = ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 284:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign ram_inst_io_deq_bits_MPORT_en = 1'h1;
  assign ram_inst_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_inst_io_deq_bits_MPORT_data = ram_inst[ram_inst_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_inst_MPORT_data = io_enq_bits_inst;
  assign ram_inst_MPORT_addr = 1'h0;
  assign ram_inst_MPORT_mask = 1'h1;
  assign ram_inst_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 309:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 308:19]
  assign io_deq_bits_inst = ram_inst_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  always @(posedge clock) begin
    if (ram_inst_MPORT_en & ram_inst_MPORT_mask) begin
      ram_inst[ram_inst_MPORT_addr] <= ram_inst_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    end else if (do_enq != do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 299:27]
      maybe_full <= do_enq; // @[src/main/scala/chisel3/util/Decoupled.scala 300:16]
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_inst[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
