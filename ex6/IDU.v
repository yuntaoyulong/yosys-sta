module IDU(
  input  [31:0] io_in_bits_pc, // @[src/main/scala/npc/IDU.scala 35:16]
  input  [31:0] io_in_bits_inst, // @[src/main/scala/npc/IDU.scala 35:16]
  input  [31:0] io_inreg_rs1_data, // @[src/main/scala/npc/IDU.scala 35:16]
  input  [31:0] io_inreg_rs2_data, // @[src/main/scala/npc/IDU.scala 35:16]
  input  [31:0] io_inreg_csr_rdata, // @[src/main/scala/npc/IDU.scala 35:16]
  input  [31:0] io_inreg_ecall_mtvec, // @[src/main/scala/npc/IDU.scala 35:16]
  input  [31:0] io_inreg_mret_epc, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_imm_i, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_imm_s, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_imm_b, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_imm_u, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_imm_j, // @[src/main/scala/npc/IDU.scala 35:16]
  output [2:0]  io_out_bits_inst_type, // @[src/main/scala/npc/IDU.scala 35:16]
  output [5:0]  io_out_bits_inst_name, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_pc, // @[src/main/scala/npc/IDU.scala 35:16]
  output [4:0]  io_out_bits_rs1_addr, // @[src/main/scala/npc/IDU.scala 35:16]
  output [4:0]  io_out_bits_rs2_addr, // @[src/main/scala/npc/IDU.scala 35:16]
  output [4:0]  io_out_bits_rd_addr, // @[src/main/scala/npc/IDU.scala 35:16]
  output [10:0] io_out_bits_csr_addr, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_rs1_data, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_rs2_data, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_ecall_epc, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_mret_epc, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_ecall_mtvec, // @[src/main/scala/npc/IDU.scala 35:16]
  output [31:0] io_out_bits_csr_rdata // @[src/main/scala/npc/IDU.scala 35:16]
);
  wire [19:0] _io_out_bits_imm_i_T_1 = io_in_bits_inst[31] ? 20'hfffff : 20'h0; // @[src/main/scala/npc/Instructions.scala 93:40]
  wire [26:0] io_out_bits_imm_s_hi = {_io_out_bits_imm_i_T_1,io_in_bits_inst[31:25]}; // @[src/main/scala/npc/Instructions.scala 94:35]
  wire [18:0] _io_out_bits_imm_b_T_1 = io_in_bits_inst[31] ? 19'h7ffff : 19'h0; // @[src/main/scala/npc/Instructions.scala 96:13]
  wire [10:0] io_out_bits_imm_b_lo = {io_in_bits_inst[30:25],io_in_bits_inst[11:8],1'h0}; // @[src/main/scala/npc/Instructions.scala 96:8]
  wire [20:0] io_out_bits_imm_b_hi = {_io_out_bits_imm_b_T_1,io_in_bits_inst[31],io_in_bits_inst[7]}; // @[src/main/scala/npc/Instructions.scala 96:8]
  wire [10:0] _io_out_bits_imm_j_T_1 = io_in_bits_inst[31] ? 11'h7ff : 11'h0; // @[src/main/scala/npc/Instructions.scala 99:13]
  wire [11:0] io_out_bits_imm_j_lo = {io_in_bits_inst[20],io_in_bits_inst[30:21],1'h0}; // @[src/main/scala/npc/Instructions.scala 99:8]
  wire [19:0] io_out_bits_imm_j_hi = {_io_out_bits_imm_j_T_1,io_in_bits_inst[31],io_in_bits_inst[19:12]}; // @[src/main/scala/npc/Instructions.scala 99:8]
  wire [31:0] io_out_bits_inst_type_invInputs = ~io_in_bits_inst; // @[src/main/scala/chisel3/util/pla.scala 78:21]
  wire  io_out_bits_inst_type_andMatrixInput_0 = io_in_bits_inst[0]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire  io_out_bits_inst_type_andMatrixInput_1 = io_in_bits_inst[1]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire  io_out_bits_inst_type_andMatrixInput_2 = io_out_bits_inst_type_invInputs[2]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_3 = io_out_bits_inst_type_invInputs[3]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_4 = io_out_bits_inst_type_invInputs[4]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_5 = io_out_bits_inst_type_invInputs[5]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_6 = io_out_bits_inst_type_invInputs[6]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_7 = io_out_bits_inst_type_invInputs[13]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire [7:0] _io_out_bits_inst_type_T = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1,
    io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3,io_out_bits_inst_type_andMatrixInput_4
    ,io_out_bits_inst_type_andMatrixInput_5,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_7}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_1 = &_io_out_bits_inst_type_T; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_6_1 = io_out_bits_inst_type_invInputs[12]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_7_1 = io_out_bits_inst_type_invInputs[14]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire [7:0] _io_out_bits_inst_type_T_2 = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1
    ,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_3 = &_io_out_bits_inst_type_T_2; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_4_2 = io_in_bits_inst[4]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [7:0] _io_out_bits_inst_type_T_4 = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1
    ,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_6_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_5 = &_io_out_bits_inst_type_T_4; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_7_3 = io_out_bits_inst_type_invInputs[25]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_8 = io_out_bits_inst_type_invInputs[26]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_9 = io_out_bits_inst_type_invInputs[27]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_10 = io_out_bits_inst_type_invInputs[28]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_11 = io_out_bits_inst_type_invInputs[29]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_12 = io_out_bits_inst_type_invInputs[30]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_type_andMatrixInput_13 = io_out_bits_inst_type_invInputs[31]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire [6:0] io_out_bits_inst_type_lo_3 = {io_out_bits_inst_type_andMatrixInput_7_3,
    io_out_bits_inst_type_andMatrixInput_8,io_out_bits_inst_type_andMatrixInput_9,
    io_out_bits_inst_type_andMatrixInput_10,io_out_bits_inst_type_andMatrixInput_11,
    io_out_bits_inst_type_andMatrixInput_12,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [13:0] _io_out_bits_inst_type_T_6 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_lo_3}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_7 = &_io_out_bits_inst_type_T_6; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_2_4 = io_in_bits_inst[2]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [5:0] _io_out_bits_inst_type_T_8 = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1
    ,io_out_bits_inst_type_andMatrixInput_2_4,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_9 = &_io_out_bits_inst_type_T_8; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_5_5 = io_in_bits_inst[5]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [8:0] _io_out_bits_inst_type_T_10 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_11 = &_io_out_bits_inst_type_T_10; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_type_T_12 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_13 = &_io_out_bits_inst_type_T_12; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [6:0] io_out_bits_inst_type_lo_7 = {io_out_bits_inst_type_andMatrixInput_7_1,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [14:0] _io_out_bits_inst_type_T_14 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_5_5,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_lo_7}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_15 = &_io_out_bits_inst_type_T_14; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [5:0] io_out_bits_inst_type_lo_8 = {io_out_bits_inst_type_andMatrixInput_8,io_out_bits_inst_type_andMatrixInput_9
    ,io_out_bits_inst_type_andMatrixInput_10,io_out_bits_inst_type_andMatrixInput_11,
    io_out_bits_inst_type_andMatrixInput_12,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [11:0] _io_out_bits_inst_type_T_16 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_lo_8}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_17 = &_io_out_bits_inst_type_T_16; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_6_8 = io_in_bits_inst[6]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [7:0] _io_out_bits_inst_type_T_18 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_19 = &_io_out_bits_inst_type_T_18; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_type_T_20 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2_4,
    io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_21 = &_io_out_bits_inst_type_T_20; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_3_11 = io_in_bits_inst[3]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [6:0] _io_out_bits_inst_type_T_22 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2_4,
    io_out_bits_inst_type_andMatrixInput_3_11,io_out_bits_inst_type_andMatrixInput_4,
    io_out_bits_inst_type_andMatrixInput_5_5,io_out_bits_inst_type_andMatrixInput_6_8}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_23 = &_io_out_bits_inst_type_T_22; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_7_10 = io_in_bits_inst[12]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [9:0] _io_out_bits_inst_type_T_24 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_25 = &_io_out_bits_inst_type_T_24; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_7_11 = io_in_bits_inst[13]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [7:0] _io_out_bits_inst_type_T_26 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_11}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_27 = &_io_out_bits_inst_type_T_26; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [9:0] _io_out_bits_inst_type_T_28 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_29 = &_io_out_bits_inst_type_T_28; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_type_andMatrixInput_7_13 = io_in_bits_inst[14]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [6:0] io_out_bits_inst_type_lo_15 = {io_out_bits_inst_type_andMatrixInput_7_13,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [13:0] _io_out_bits_inst_type_T_30 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_lo_15}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_31 = &_io_out_bits_inst_type_T_30; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] _io_out_bits_inst_type_T_32 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_33 = &_io_out_bits_inst_type_T_32; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [14:0] _io_out_bits_inst_type_T_34 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_lo_15}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_type_T_35 = &_io_out_bits_inst_type_T_34; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [5:0] _io_out_bits_inst_type_orMatrixOutputs_T = {_io_out_bits_inst_type_T_9,_io_out_bits_inst_type_T_11,
    _io_out_bits_inst_type_T_13,_io_out_bits_inst_type_T_15,_io_out_bits_inst_type_T_17,_io_out_bits_inst_type_T_35}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_type_orMatrixOutputs_T_1 = |_io_out_bits_inst_type_orMatrixOutputs_T; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [4:0] io_out_bits_inst_type_orMatrixOutputs_lo_1 = {_io_out_bits_inst_type_T_23,_io_out_bits_inst_type_T_25,
    _io_out_bits_inst_type_T_27,_io_out_bits_inst_type_T_29,_io_out_bits_inst_type_T_31}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [10:0] _io_out_bits_inst_type_orMatrixOutputs_T_2 = {_io_out_bits_inst_type_T_1,_io_out_bits_inst_type_T_3,
    _io_out_bits_inst_type_T_5,_io_out_bits_inst_type_T_7,_io_out_bits_inst_type_T_13,_io_out_bits_inst_type_T_21,
    io_out_bits_inst_type_orMatrixOutputs_lo_1}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_type_orMatrixOutputs_T_3 = |_io_out_bits_inst_type_orMatrixOutputs_T_2; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [3:0] _io_out_bits_inst_type_orMatrixOutputs_T_4 = {_io_out_bits_inst_type_T_9,_io_out_bits_inst_type_T_19,
    _io_out_bits_inst_type_T_23,_io_out_bits_inst_type_T_33}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_type_orMatrixOutputs_T_5 = |_io_out_bits_inst_type_orMatrixOutputs_T_4; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [2:0] io_out_bits_inst_type_orMatrixOutputs = {_io_out_bits_inst_type_orMatrixOutputs_T_5,
    _io_out_bits_inst_type_orMatrixOutputs_T_3,_io_out_bits_inst_type_orMatrixOutputs_T_1}; // @[src/main/scala/chisel3/util/pla.scala 102:36]
  wire [1:0] io_out_bits_inst_type_invMatrixOutputs_hi = {io_out_bits_inst_type_orMatrixOutputs[2],
    io_out_bits_inst_type_orMatrixOutputs[1]}; // @[src/main/scala/chisel3/util/pla.scala 120:37]
  wire [8:0] _io_out_bits_inst_name_T = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1,
    io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3,io_out_bits_inst_type_andMatrixInput_4
    ,io_out_bits_inst_type_andMatrixInput_5,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_1 = &_io_out_bits_inst_name_T; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_2 = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1
    ,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5,io_out_bits_inst_type_andMatrixInput_6
    ,io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_3 = &_io_out_bits_inst_name_T_2; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_4 = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1
    ,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_5 = &_io_out_bits_inst_name_T_4; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] _io_out_bits_inst_name_T_6 = {io_out_bits_inst_type_andMatrixInput_0,io_out_bits_inst_type_andMatrixInput_1
    ,io_out_bits_inst_type_andMatrixInput_3,io_out_bits_inst_type_andMatrixInput_4_2,
    io_out_bits_inst_type_andMatrixInput_5,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_7 = &_io_out_bits_inst_name_T_6; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [6:0] io_out_bits_inst_name_lo_4 = {io_out_bits_inst_type_andMatrixInput_7_1,
    io_out_bits_inst_type_andMatrixInput_8,io_out_bits_inst_type_andMatrixInput_9,
    io_out_bits_inst_type_andMatrixInput_10,io_out_bits_inst_type_andMatrixInput_11,
    io_out_bits_inst_type_andMatrixInput_12,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [14:0] _io_out_bits_inst_name_T_8 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_name_lo_4}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_9 = &_io_out_bits_inst_name_T_8; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [6:0] _io_out_bits_inst_name_T_12 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2_4,
    io_out_bits_inst_type_andMatrixInput_3,io_out_bits_inst_type_andMatrixInput_4_2,
    io_out_bits_inst_type_andMatrixInput_5,io_out_bits_inst_type_andMatrixInput_6}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_13 = &_io_out_bits_inst_name_T_12; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [9:0] _io_out_bits_inst_name_T_18 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2_4,
    io_out_bits_inst_type_andMatrixInput_3,io_out_bits_inst_type_andMatrixInput_4,
    io_out_bits_inst_type_andMatrixInput_5_5,io_out_bits_inst_type_andMatrixInput_6_8,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_19 = &_io_out_bits_inst_name_T_18; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_name_andMatrixInput_7_8 = io_out_bits_inst_type_invInputs[7]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_8_6 = io_out_bits_inst_type_invInputs[8]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_9_2 = io_out_bits_inst_type_invInputs[9]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_10_1 = io_out_bits_inst_type_invInputs[10]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_11_1 = io_out_bits_inst_type_invInputs[11]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_15 = io_out_bits_inst_type_invInputs[15]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_16 = io_out_bits_inst_type_invInputs[16]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_17 = io_out_bits_inst_type_invInputs[17]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_18 = io_out_bits_inst_type_invInputs[18]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_19 = io_out_bits_inst_type_invInputs[19]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_20 = io_out_bits_inst_type_invInputs[21]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_21 = io_out_bits_inst_type_invInputs[22]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_22 = io_out_bits_inst_type_invInputs[23]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire  io_out_bits_inst_name_andMatrixInput_23 = io_out_bits_inst_type_invInputs[24]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire [14:0] io_out_bits_inst_name_lo_11 = {io_out_bits_inst_name_andMatrixInput_16,
    io_out_bits_inst_name_andMatrixInput_17,io_out_bits_inst_name_andMatrixInput_18,
    io_out_bits_inst_name_andMatrixInput_19,io_out_bits_inst_name_andMatrixInput_20,
    io_out_bits_inst_name_andMatrixInput_21,io_out_bits_inst_name_andMatrixInput_22,
    io_out_bits_inst_name_andMatrixInput_23,io_out_bits_inst_type_lo_3}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [7:0] io_out_bits_inst_name_hi_lo_10 = {io_out_bits_inst_name_andMatrixInput_8_6,
    io_out_bits_inst_name_andMatrixInput_9_2,io_out_bits_inst_name_andMatrixInput_10_1,
    io_out_bits_inst_name_andMatrixInput_11_1,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_andMatrixInput_7_1,
    io_out_bits_inst_name_andMatrixInput_15}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [30:0] _io_out_bits_inst_name_T_22 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_name_andMatrixInput_7_8,io_out_bits_inst_name_hi_lo_10,
    io_out_bits_inst_name_lo_11}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_23 = &_io_out_bits_inst_name_T_22; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_name_andMatrixInput_19_1 = io_out_bits_inst_type_invInputs[20]; // @[src/main/scala/chisel3/util/pla.scala 91:29]
  wire [14:0] io_out_bits_inst_name_lo_12 = {io_out_bits_inst_name_andMatrixInput_17,
    io_out_bits_inst_name_andMatrixInput_18,io_out_bits_inst_name_andMatrixInput_19,
    io_out_bits_inst_name_andMatrixInput_19_1,io_out_bits_inst_name_andMatrixInput_20,
    io_out_bits_inst_name_andMatrixInput_21,io_out_bits_inst_name_andMatrixInput_22,
    io_out_bits_inst_name_andMatrixInput_23,io_out_bits_inst_type_lo_3}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [7:0] io_out_bits_inst_name_hi_lo_11 = {io_out_bits_inst_name_andMatrixInput_8_6,
    io_out_bits_inst_name_andMatrixInput_9_2,io_out_bits_inst_name_andMatrixInput_10_1,
    io_out_bits_inst_name_andMatrixInput_11_1,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7_1,io_out_bits_inst_name_andMatrixInput_15,
    io_out_bits_inst_name_andMatrixInput_16}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [30:0] _io_out_bits_inst_name_T_24 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_name_andMatrixInput_7_8,io_out_bits_inst_name_hi_lo_11,
    io_out_bits_inst_name_lo_12}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_25 = &_io_out_bits_inst_name_T_24; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [9:0] _io_out_bits_inst_name_T_26 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_27 = &_io_out_bits_inst_name_T_26; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] io_out_bits_inst_name_lo_14 = {io_out_bits_inst_type_andMatrixInput_7_1,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_12,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] _io_out_bits_inst_name_T_28 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_name_lo_14}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_29 = &_io_out_bits_inst_name_T_28; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [9:0] _io_out_bits_inst_name_T_30 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_31 = &_io_out_bits_inst_name_T_30; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] io_out_bits_inst_name_lo_16 = {io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_12,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] _io_out_bits_inst_name_T_32 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_name_lo_16}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_33 = &_io_out_bits_inst_name_T_32; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [15:0] _io_out_bits_inst_name_T_34 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_name_lo_14}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_35 = &_io_out_bits_inst_name_T_34; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_36 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_37 = &_io_out_bits_inst_name_T_36; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_40 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7_11,
    io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_41 = &_io_out_bits_inst_name_T_40; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_42 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_11,
    io_out_bits_inst_type_andMatrixInput_7_1}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_43 = &_io_out_bits_inst_name_T_42; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [12:0] _io_out_bits_inst_name_T_44 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_type_andMatrixInput_7_1,io_out_bits_inst_type_lo_8}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_45 = &_io_out_bits_inst_name_T_44; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_48 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7_11}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_49 = &_io_out_bits_inst_name_T_48; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_50 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_5,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_51 = &_io_out_bits_inst_name_T_50; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [6:0] io_out_bits_inst_name_lo_26 = {io_out_bits_inst_type_andMatrixInput_7_13,
    io_out_bits_inst_type_andMatrixInput_8,io_out_bits_inst_type_andMatrixInput_9,
    io_out_bits_inst_type_andMatrixInput_10,io_out_bits_inst_type_andMatrixInput_11,
    io_out_bits_inst_type_andMatrixInput_12,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [13:0] _io_out_bits_inst_name_T_52 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_name_lo_26}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_53 = &_io_out_bits_inst_name_T_52; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] io_out_bits_inst_name_lo_27 = {io_out_bits_inst_type_andMatrixInput_7_13,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_12,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] _io_out_bits_inst_name_T_54 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_name_lo_27}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_55 = &_io_out_bits_inst_name_T_54; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_56 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_57 = &_io_out_bits_inst_name_T_56; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [9:0] _io_out_bits_inst_name_T_58 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_59 = &_io_out_bits_inst_name_T_58; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [14:0] _io_out_bits_inst_name_T_60 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_type_lo_15}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_61 = &_io_out_bits_inst_name_T_60; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_62 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_63 = &_io_out_bits_inst_name_T_62; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_64 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_11,
    io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_65 = &_io_out_bits_inst_name_T_64; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [16:0] _io_out_bits_inst_name_T_66 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_6_1,
    io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_name_lo_27}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_67 = &_io_out_bits_inst_name_T_66; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_68 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_type_andMatrixInput_7_11,
    io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_69 = &_io_out_bits_inst_name_T_68; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [8:0] _io_out_bits_inst_name_T_70 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_type_andMatrixInput_7_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_71 = &_io_out_bits_inst_name_T_70; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [15:0] _io_out_bits_inst_name_T_72 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_name_lo_27}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_73 = &_io_out_bits_inst_name_T_72; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_name_andMatrixInput_8_32 = io_in_bits_inst[25]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [6:0] io_out_bits_inst_name_lo_37 = {io_out_bits_inst_name_andMatrixInput_8_32,
    io_out_bits_inst_type_andMatrixInput_8,io_out_bits_inst_type_andMatrixInput_9,
    io_out_bits_inst_type_andMatrixInput_10,io_out_bits_inst_type_andMatrixInput_11,
    io_out_bits_inst_type_andMatrixInput_12,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [14:0] _io_out_bits_inst_name_T_74 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_name_lo_37}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_75 = &_io_out_bits_inst_name_T_74; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] io_out_bits_inst_name_lo_38 = {io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_name_andMatrixInput_8_32,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_12,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] _io_out_bits_inst_name_T_76 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_name_lo_38}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_77 = &_io_out_bits_inst_name_T_76; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [13:0] _io_out_bits_inst_name_T_78 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_1,io_out_bits_inst_name_lo_37}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_79 = &_io_out_bits_inst_name_T_78; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [14:0] _io_out_bits_inst_name_T_80 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7_1,io_out_bits_inst_name_lo_37}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_81 = &_io_out_bits_inst_name_T_80; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [14:0] _io_out_bits_inst_name_T_82 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_name_lo_37}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_83 = &_io_out_bits_inst_name_T_82; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] io_out_bits_inst_name_lo_42 = {io_out_bits_inst_type_andMatrixInput_7_13,
    io_out_bits_inst_name_andMatrixInput_8_32,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_type_andMatrixInput_12,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] _io_out_bits_inst_name_T_84 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_name_lo_42}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_85 = &_io_out_bits_inst_name_T_84; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [15:0] _io_out_bits_inst_name_T_86 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_11,io_out_bits_inst_name_lo_42}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_87 = &_io_out_bits_inst_name_T_86; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_name_andMatrixInput_21_2 = io_in_bits_inst[21]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire  io_out_bits_inst_name_andMatrixInput_28_2 = io_in_bits_inst[28]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire  io_out_bits_inst_name_andMatrixInput_29_2 = io_in_bits_inst[29]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [7:0] io_out_bits_inst_name_lo_lo_41 = {io_out_bits_inst_name_andMatrixInput_23,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_name_andMatrixInput_28_2,
    io_out_bits_inst_name_andMatrixInput_29_2,io_out_bits_inst_type_andMatrixInput_12,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] io_out_bits_inst_name_lo_44 = {io_out_bits_inst_name_andMatrixInput_16,
    io_out_bits_inst_name_andMatrixInput_17,io_out_bits_inst_name_andMatrixInput_18,
    io_out_bits_inst_name_andMatrixInput_19,io_out_bits_inst_name_andMatrixInput_19_1,
    io_out_bits_inst_name_andMatrixInput_21_2,io_out_bits_inst_name_andMatrixInput_21,
    io_out_bits_inst_name_andMatrixInput_22,io_out_bits_inst_name_lo_lo_41}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [31:0] _io_out_bits_inst_name_T_88 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5_5,
    io_out_bits_inst_type_andMatrixInput_6_8,io_out_bits_inst_name_andMatrixInput_7_8,io_out_bits_inst_name_hi_lo_10,
    io_out_bits_inst_name_lo_44}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_89 = &_io_out_bits_inst_name_T_88; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire  io_out_bits_inst_name_andMatrixInput_14_17 = io_in_bits_inst[30]; // @[src/main/scala/chisel3/util/pla.scala 90:45]
  wire [7:0] io_out_bits_inst_name_lo_45 = {io_out_bits_inst_type_andMatrixInput_7_1,
    io_out_bits_inst_type_andMatrixInput_7_3,io_out_bits_inst_type_andMatrixInput_8,
    io_out_bits_inst_type_andMatrixInput_9,io_out_bits_inst_type_andMatrixInput_10,
    io_out_bits_inst_type_andMatrixInput_11,io_out_bits_inst_name_andMatrixInput_14_17,
    io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [15:0] _io_out_bits_inst_name_T_90 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_2,io_out_bits_inst_type_andMatrixInput_3
    ,io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_6_1,io_out_bits_inst_type_andMatrixInput_7,io_out_bits_inst_name_lo_45}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_91 = &_io_out_bits_inst_name_T_90; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [6:0] io_out_bits_inst_name_lo_46 = {io_out_bits_inst_type_andMatrixInput_7_3,
    io_out_bits_inst_type_andMatrixInput_8,io_out_bits_inst_type_andMatrixInput_9,
    io_out_bits_inst_type_andMatrixInput_10,io_out_bits_inst_type_andMatrixInput_11,
    io_out_bits_inst_name_andMatrixInput_14_17,io_out_bits_inst_type_andMatrixInput_13}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire [14:0] _io_out_bits_inst_name_T_92 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_5,
    io_out_bits_inst_type_andMatrixInput_6,io_out_bits_inst_type_andMatrixInput_7_10,
    io_out_bits_inst_type_andMatrixInput_7_13,io_out_bits_inst_name_lo_46}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_93 = &_io_out_bits_inst_name_T_92; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [14:0] _io_out_bits_inst_name_T_94 = {io_out_bits_inst_type_andMatrixInput_0,
    io_out_bits_inst_type_andMatrixInput_1,io_out_bits_inst_type_andMatrixInput_3,
    io_out_bits_inst_type_andMatrixInput_4_2,io_out_bits_inst_type_andMatrixInput_6,
    io_out_bits_inst_type_andMatrixInput_7_10,io_out_bits_inst_type_andMatrixInput_7,
    io_out_bits_inst_type_andMatrixInput_7_13,io_out_bits_inst_name_lo_46}; // @[src/main/scala/chisel3/util/pla.scala 98:53]
  wire  _io_out_bits_inst_name_T_95 = &_io_out_bits_inst_name_T_94; // @[src/main/scala/chisel3/util/pla.scala 98:70]
  wire [7:0] io_out_bits_inst_name_orMatrixOutputs_lo = {_io_out_bits_inst_name_T_37,_io_out_bits_inst_type_T_29,
    _io_out_bits_inst_name_T_51,_io_out_bits_inst_name_T_63,_io_out_bits_inst_name_T_67,_io_out_bits_inst_name_T_71,
    _io_out_bits_inst_name_T_75,_io_out_bits_inst_name_T_93}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [16:0] _io_out_bits_inst_name_orMatrixOutputs_T = {_io_out_bits_inst_name_T_7,_io_out_bits_inst_name_T_9,
    _io_out_bits_inst_name_T_13,_io_out_bits_inst_type_T_11,_io_out_bits_inst_name_T_19,_io_out_bits_inst_name_T_25,
    _io_out_bits_inst_name_T_27,_io_out_bits_inst_name_T_33,_io_out_bits_inst_name_T_35,
    io_out_bits_inst_name_orMatrixOutputs_lo}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_name_orMatrixOutputs_T_1 = |_io_out_bits_inst_name_orMatrixOutputs_T; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [7:0] io_out_bits_inst_name_orMatrixOutputs_lo_1 = {_io_out_bits_inst_name_T_55,_io_out_bits_inst_name_T_57,
    _io_out_bits_inst_name_T_65,_io_out_bits_inst_name_T_73,_io_out_bits_inst_name_T_77,_io_out_bits_inst_name_T_83,
    _io_out_bits_inst_name_T_89,_io_out_bits_inst_name_T_91}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [16:0] _io_out_bits_inst_name_orMatrixOutputs_T_2 = {_io_out_bits_inst_name_T_5,_io_out_bits_inst_name_T_19,
    _io_out_bits_inst_type_T_23,_io_out_bits_inst_name_T_23,_io_out_bits_inst_name_T_31,_io_out_bits_inst_name_T_33,
    _io_out_bits_inst_name_T_41,_io_out_bits_inst_name_T_49,_io_out_bits_inst_name_T_51,
    io_out_bits_inst_name_orMatrixOutputs_lo_1}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_name_orMatrixOutputs_T_3 = |_io_out_bits_inst_name_orMatrixOutputs_T_2; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [5:0] io_out_bits_inst_name_orMatrixOutputs_lo_2 = {_io_out_bits_inst_name_T_43,_io_out_bits_inst_name_T_45,
    _io_out_bits_inst_name_T_51,_io_out_bits_inst_name_T_53,_io_out_bits_inst_name_T_55,_io_out_bits_inst_name_T_81}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [11:0] _io_out_bits_inst_name_orMatrixOutputs_T_4 = {_io_out_bits_inst_name_T_3,_io_out_bits_inst_type_T_9,
    _io_out_bits_inst_type_T_19,_io_out_bits_inst_name_T_23,_io_out_bits_inst_name_T_27,_io_out_bits_inst_name_T_29,
    io_out_bits_inst_name_orMatrixOutputs_lo_2}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_name_orMatrixOutputs_T_5 = |_io_out_bits_inst_name_orMatrixOutputs_T_4; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [7:0] io_out_bits_inst_name_orMatrixOutputs_lo_3 = {_io_out_bits_inst_name_T_65,_io_out_bits_inst_name_T_67,
    _io_out_bits_inst_name_T_69,_io_out_bits_inst_name_T_73,_io_out_bits_inst_name_T_77,_io_out_bits_inst_name_T_79,
    _io_out_bits_inst_name_T_81,_io_out_bits_inst_name_T_95}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [15:0] _io_out_bits_inst_name_orMatrixOutputs_T_6 = {_io_out_bits_inst_name_T_1,_io_out_bits_inst_name_T_3,
    _io_out_bits_inst_type_T_9,_io_out_bits_inst_name_T_19,_io_out_bits_inst_type_T_23,_io_out_bits_inst_name_T_23,
    _io_out_bits_inst_name_T_27,_io_out_bits_inst_name_T_61,io_out_bits_inst_name_orMatrixOutputs_lo_3}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_name_orMatrixOutputs_T_7 = |_io_out_bits_inst_name_orMatrixOutputs_T_6; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [5:0] io_out_bits_inst_name_orMatrixOutputs_lo_4 = {_io_out_bits_inst_name_T_51,_io_out_bits_inst_name_T_61,
    _io_out_bits_inst_name_T_65,_io_out_bits_inst_name_T_85,_io_out_bits_inst_name_T_87,_io_out_bits_inst_name_T_89}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [12:0] _io_out_bits_inst_name_orMatrixOutputs_T_8 = {_io_out_bits_inst_name_T_3,_io_out_bits_inst_name_T_5,
    _io_out_bits_inst_name_T_27,_io_out_bits_inst_name_T_29,_io_out_bits_inst_type_T_25,_io_out_bits_inst_name_T_43,
    _io_out_bits_inst_type_T_29,io_out_bits_inst_name_orMatrixOutputs_lo_4}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_name_orMatrixOutputs_T_9 = |_io_out_bits_inst_name_orMatrixOutputs_T_8; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [5:0] io_out_bits_inst_name_orMatrixOutputs_lo_5 = {_io_out_bits_inst_name_T_31,_io_out_bits_inst_type_T_25,
    _io_out_bits_inst_type_T_29,_io_out_bits_inst_name_T_59,_io_out_bits_inst_name_T_69,_io_out_bits_inst_name_T_89}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire [11:0] _io_out_bits_inst_name_orMatrixOutputs_T_10 = {_io_out_bits_inst_type_T_9,_io_out_bits_inst_type_T_11,
    _io_out_bits_inst_type_T_19,_io_out_bits_inst_name_T_19,_io_out_bits_inst_type_T_23,_io_out_bits_inst_name_T_23,
    io_out_bits_inst_name_orMatrixOutputs_lo_5}; // @[src/main/scala/chisel3/util/pla.scala 114:19]
  wire  _io_out_bits_inst_name_orMatrixOutputs_T_11 = |_io_out_bits_inst_name_orMatrixOutputs_T_10; // @[src/main/scala/chisel3/util/pla.scala 114:36]
  wire [5:0] io_out_bits_inst_name_orMatrixOutputs = {_io_out_bits_inst_name_orMatrixOutputs_T_11,
    _io_out_bits_inst_name_orMatrixOutputs_T_9,_io_out_bits_inst_name_orMatrixOutputs_T_7,
    _io_out_bits_inst_name_orMatrixOutputs_T_5,_io_out_bits_inst_name_orMatrixOutputs_T_3,
    _io_out_bits_inst_name_orMatrixOutputs_T_1}; // @[src/main/scala/chisel3/util/pla.scala 102:36]
  wire [2:0] io_out_bits_inst_name_invMatrixOutputs_lo = {io_out_bits_inst_name_orMatrixOutputs[2],
    io_out_bits_inst_name_orMatrixOutputs[1],io_out_bits_inst_name_orMatrixOutputs[0]}; // @[src/main/scala/chisel3/util/pla.scala 120:37]
  wire [2:0] io_out_bits_inst_name_invMatrixOutputs_hi = {io_out_bits_inst_name_orMatrixOutputs[5],
    io_out_bits_inst_name_orMatrixOutputs[4],io_out_bits_inst_name_orMatrixOutputs[3]}; // @[src/main/scala/chisel3/util/pla.scala 120:37]
  assign io_out_bits_imm_i = {_io_out_bits_imm_i_T_1,io_in_bits_inst[31:20]}; // @[src/main/scala/npc/Instructions.scala 93:35]
  assign io_out_bits_imm_s = {io_out_bits_imm_s_hi,io_in_bits_inst[11:7]}; // @[src/main/scala/npc/Instructions.scala 94:35]
  assign io_out_bits_imm_b = {io_out_bits_imm_b_hi,io_out_bits_imm_b_lo}; // @[src/main/scala/npc/Instructions.scala 96:8]
  assign io_out_bits_imm_u = {io_in_bits_inst[31:12],12'h0}; // @[src/main/scala/npc/Instructions.scala 97:35]
  assign io_out_bits_imm_j = {io_out_bits_imm_j_hi,io_out_bits_imm_j_lo}; // @[src/main/scala/npc/Instructions.scala 99:8]
  assign io_out_bits_inst_type = {io_out_bits_inst_type_invMatrixOutputs_hi,io_out_bits_inst_type_orMatrixOutputs[0]}; // @[src/main/scala/chisel3/util/pla.scala 120:37]
  assign io_out_bits_inst_name = {io_out_bits_inst_name_invMatrixOutputs_hi,io_out_bits_inst_name_invMatrixOutputs_lo}; // @[src/main/scala/chisel3/util/pla.scala 120:37]
  assign io_out_bits_pc = io_in_bits_pc; // @[src/main/scala/npc/IDU.scala 218:20]
  assign io_out_bits_rs1_addr = io_in_bits_inst[19:15]; // @[src/main/scala/npc/IDU.scala 48:33]
  assign io_out_bits_rs2_addr = io_in_bits_inst[24:20]; // @[src/main/scala/npc/IDU.scala 49:33]
  assign io_out_bits_rd_addr = io_in_bits_inst[11:7]; // @[src/main/scala/npc/IDU.scala 50:32]
  assign io_out_bits_csr_addr = io_in_bits_inst[30:20]; // @[src/main/scala/npc/IDU.scala 51:26]
  assign io_out_bits_rs1_data = io_inreg_rs1_data; // @[src/main/scala/npc/IDU.scala 220:29]
  assign io_out_bits_rs2_data = io_inreg_rs2_data; // @[src/main/scala/npc/IDU.scala 221:29]
  assign io_out_bits_ecall_epc = io_in_bits_pc; // @[src/main/scala/npc/IDU.scala 219:27]
  assign io_out_bits_mret_epc = io_inreg_mret_epc; // @[src/main/scala/npc/IDU.scala 222:29]
  assign io_out_bits_ecall_mtvec = io_inreg_ecall_mtvec; // @[src/main/scala/npc/IDU.scala 223:29]
  assign io_out_bits_csr_rdata = io_inreg_csr_rdata; // @[src/main/scala/npc/IDU.scala 224:29]
endmodule
