module Dmem(
  input         clock,
  input         io_req_valid, // @[src/main/scala/npc/pmemio.scala 30:14]
  input         io_req_wen, // @[src/main/scala/npc/pmemio.scala 30:14]
  input  [31:0] io_req_raddr, // @[src/main/scala/npc/pmemio.scala 30:14]
  input  [31:0] io_req_waddr, // @[src/main/scala/npc/pmemio.scala 30:14]
  input  [31:0] io_req_wdata, // @[src/main/scala/npc/pmemio.scala 30:14]
  input  [3:0]  io_req_wmask, // @[src/main/scala/npc/pmemio.scala 30:14]
  output [31:0] io_rdata // @[src/main/scala/npc/pmemio.scala 30:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0 [0:255]; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_0_rvec_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_0_rvec_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_0_rvec_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_0_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_0_MPORT_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_0_MPORT_mask; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_0_MPORT_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  reg  mem_0_rvec_en_pipe_0;
  reg [7:0] mem_0_rvec_addr_pipe_0;
  reg [7:0] mem_1 [0:255]; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_1_rvec_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_1_rvec_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_1_rvec_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_1_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_1_MPORT_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_1_MPORT_mask; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_1_MPORT_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  reg  mem_1_rvec_en_pipe_0;
  reg [7:0] mem_1_rvec_addr_pipe_0;
  reg [7:0] mem_2 [0:255]; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_2_rvec_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_2_rvec_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_2_rvec_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_2_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_2_MPORT_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_2_MPORT_mask; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_2_MPORT_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  reg  mem_2_rvec_en_pipe_0;
  reg [7:0] mem_2_rvec_addr_pipe_0;
  reg [7:0] mem_3 [0:255]; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_3_rvec_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_3_rvec_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_3_rvec_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_3_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire [7:0] mem_3_MPORT_addr; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_3_MPORT_mask; // @[src/main/scala/npc/pmemio.scala 33:24]
  wire  mem_3_MPORT_en; // @[src/main/scala/npc/pmemio.scala 33:24]
  reg  mem_3_rvec_en_pipe_0;
  reg [7:0] mem_3_rvec_addr_pipe_0;
  wire [31:0] _io_rdata_T = {mem_3_rvec_data,mem_2_rvec_data,mem_1_rvec_data,mem_0_rvec_data}; // @[src/main/scala/npc/pmemio.scala 47:20]
  assign mem_0_rvec_en = mem_0_rvec_en_pipe_0;
  assign mem_0_rvec_addr = mem_0_rvec_addr_pipe_0;
  assign mem_0_rvec_data = mem_0[mem_0_rvec_addr]; // @[src/main/scala/npc/pmemio.scala 33:24]
  assign mem_0_MPORT_data = io_req_wdata[7:0];
  assign mem_0_MPORT_addr = io_req_waddr[7:0];
  assign mem_0_MPORT_mask = io_req_wmask[0];
  assign mem_0_MPORT_en = io_req_valid & io_req_wen;
  assign mem_1_rvec_en = mem_1_rvec_en_pipe_0;
  assign mem_1_rvec_addr = mem_1_rvec_addr_pipe_0;
  assign mem_1_rvec_data = mem_1[mem_1_rvec_addr]; // @[src/main/scala/npc/pmemio.scala 33:24]
  assign mem_1_MPORT_data = io_req_wdata[15:8];
  assign mem_1_MPORT_addr = io_req_waddr[7:0];
  assign mem_1_MPORT_mask = io_req_wmask[1];
  assign mem_1_MPORT_en = io_req_valid & io_req_wen;
  assign mem_2_rvec_en = mem_2_rvec_en_pipe_0;
  assign mem_2_rvec_addr = mem_2_rvec_addr_pipe_0;
  assign mem_2_rvec_data = mem_2[mem_2_rvec_addr]; // @[src/main/scala/npc/pmemio.scala 33:24]
  assign mem_2_MPORT_data = io_req_wdata[23:16];
  assign mem_2_MPORT_addr = io_req_waddr[7:0];
  assign mem_2_MPORT_mask = io_req_wmask[2];
  assign mem_2_MPORT_en = io_req_valid & io_req_wen;
  assign mem_3_rvec_en = mem_3_rvec_en_pipe_0;
  assign mem_3_rvec_addr = mem_3_rvec_addr_pipe_0;
  assign mem_3_rvec_data = mem_3[mem_3_rvec_addr]; // @[src/main/scala/npc/pmemio.scala 33:24]
  assign mem_3_MPORT_data = io_req_wdata[31:24];
  assign mem_3_MPORT_addr = io_req_waddr[7:0];
  assign mem_3_MPORT_mask = io_req_wmask[3];
  assign mem_3_MPORT_en = io_req_valid & io_req_wen;
  assign io_rdata = io_req_valid ? _io_rdata_T : 32'h0; // @[src/main/scala/npc/pmemio.scala 39:22 47:14 49:14]
  always @(posedge clock) begin
    if (mem_0_MPORT_en & mem_0_MPORT_mask) begin
      mem_0[mem_0_MPORT_addr] <= mem_0_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
    end
    mem_0_rvec_en_pipe_0 <= io_req_valid;
    if (io_req_valid) begin
      mem_0_rvec_addr_pipe_0 <= io_req_raddr[7:0];
    end
    if (mem_1_MPORT_en & mem_1_MPORT_mask) begin
      mem_1[mem_1_MPORT_addr] <= mem_1_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
    end
    mem_1_rvec_en_pipe_0 <= io_req_valid;
    if (io_req_valid) begin
      mem_1_rvec_addr_pipe_0 <= io_req_raddr[7:0];
    end
    if (mem_2_MPORT_en & mem_2_MPORT_mask) begin
      mem_2[mem_2_MPORT_addr] <= mem_2_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
    end
    mem_2_rvec_en_pipe_0 <= io_req_valid;
    if (io_req_valid) begin
      mem_2_rvec_addr_pipe_0 <= io_req_raddr[7:0];
    end
    if (mem_3_MPORT_en & mem_3_MPORT_mask) begin
      mem_3[mem_3_MPORT_addr] <= mem_3_MPORT_data; // @[src/main/scala/npc/pmemio.scala 33:24]
    end
    mem_3_rvec_en_pipe_0 <= io_req_valid;
    if (io_req_valid) begin
      mem_3_rvec_addr_pipe_0 <= io_req_raddr[7:0];
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
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_rvec_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_rvec_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1_rvec_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1_rvec_addr_pipe_0 = _RAND_5[7:0];
  _RAND_7 = {1{`RANDOM}};
  mem_2_rvec_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2_rvec_addr_pipe_0 = _RAND_8[7:0];
  _RAND_10 = {1{`RANDOM}};
  mem_3_rvec_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_3_rvec_addr_pipe_0 = _RAND_11[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
