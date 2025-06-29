module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_in_rs1_addr, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input  [4:0]  io_in_rs2_addr, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input  [4:0]  io_in_rd_addr, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input  [31:0] io_in_rd_data, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input         io_in_rd_wen, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input  [10:0] io_in_csr_addr, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input  [31:0] io_in_csr_wdata, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input         io_in_csr_wen, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input         io_in_do_ecall, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input  [31:0] io_in_ecall_epc, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  input         io_in_do_mret, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_out_rs1_data, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_out_rs2_data, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_out_csr_rdata, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_out_ecall_mtvec, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_out_mret_epc, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_0, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_1, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_2, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_3, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_4, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_5, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_6, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_7, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_8, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_9, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_10, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_11, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_12, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_13, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_14, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_15, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_16, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_17, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_18, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_19, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_20, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_21, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_22, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_23, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_24, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_25, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_26, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_27, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_28, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_29, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_30, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_regs_out_31, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_csrs_out_0, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_csrs_out_1, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_csrs_out_2, // @[src/main/scala/npc/RegisterFile.scala 20:16]
  output [31:0] io_csrs_out_3 // @[src/main/scala/npc/RegisterFile.scala 20:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regs_0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_1; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_2; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_3; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_4; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_5; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_6; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_7; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_8; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_9; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_10; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_11; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_12; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_13; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_14; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_15; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_16; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_17; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_18; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_19; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_20; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_21; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_22; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_23; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_24; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_25; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_26; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_27; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_28; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_29; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_30; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] regs_31; // @[src/main/scala/npc/RegisterFile.scala 24:23]
  reg [31:0] csrs_0; // @[src/main/scala/npc/RegisterFile.scala 25:23]
  reg [31:0] csrs_1; // @[src/main/scala/npc/RegisterFile.scala 25:23]
  reg [31:0] csrs_2; // @[src/main/scala/npc/RegisterFile.scala 25:23]
  reg [31:0] csrs_3; // @[src/main/scala/npc/RegisterFile.scala 25:23]
  wire [31:0] _GEN_1 = 5'h1 == io_in_rs1_addr ? regs_1 : regs_0; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_2 = 5'h2 == io_in_rs1_addr ? regs_2 : _GEN_1; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_3 = 5'h3 == io_in_rs1_addr ? regs_3 : _GEN_2; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_4 = 5'h4 == io_in_rs1_addr ? regs_4 : _GEN_3; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_5 = 5'h5 == io_in_rs1_addr ? regs_5 : _GEN_4; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_6 = 5'h6 == io_in_rs1_addr ? regs_6 : _GEN_5; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_7 = 5'h7 == io_in_rs1_addr ? regs_7 : _GEN_6; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_8 = 5'h8 == io_in_rs1_addr ? regs_8 : _GEN_7; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_9 = 5'h9 == io_in_rs1_addr ? regs_9 : _GEN_8; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_10 = 5'ha == io_in_rs1_addr ? regs_10 : _GEN_9; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_11 = 5'hb == io_in_rs1_addr ? regs_11 : _GEN_10; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_12 = 5'hc == io_in_rs1_addr ? regs_12 : _GEN_11; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_13 = 5'hd == io_in_rs1_addr ? regs_13 : _GEN_12; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_14 = 5'he == io_in_rs1_addr ? regs_14 : _GEN_13; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_15 = 5'hf == io_in_rs1_addr ? regs_15 : _GEN_14; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_16 = 5'h10 == io_in_rs1_addr ? regs_16 : _GEN_15; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_17 = 5'h11 == io_in_rs1_addr ? regs_17 : _GEN_16; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_18 = 5'h12 == io_in_rs1_addr ? regs_18 : _GEN_17; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_19 = 5'h13 == io_in_rs1_addr ? regs_19 : _GEN_18; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_20 = 5'h14 == io_in_rs1_addr ? regs_20 : _GEN_19; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_21 = 5'h15 == io_in_rs1_addr ? regs_21 : _GEN_20; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_22 = 5'h16 == io_in_rs1_addr ? regs_22 : _GEN_21; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_23 = 5'h17 == io_in_rs1_addr ? regs_23 : _GEN_22; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_24 = 5'h18 == io_in_rs1_addr ? regs_24 : _GEN_23; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_25 = 5'h19 == io_in_rs1_addr ? regs_25 : _GEN_24; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_26 = 5'h1a == io_in_rs1_addr ? regs_26 : _GEN_25; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_27 = 5'h1b == io_in_rs1_addr ? regs_27 : _GEN_26; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_28 = 5'h1c == io_in_rs1_addr ? regs_28 : _GEN_27; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_29 = 5'h1d == io_in_rs1_addr ? regs_29 : _GEN_28; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_30 = 5'h1e == io_in_rs1_addr ? regs_30 : _GEN_29; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_31 = 5'h1f == io_in_rs1_addr ? regs_31 : _GEN_30; // @[src/main/scala/npc/RegisterFile.scala 28:{27,27}]
  wire [31:0] _GEN_33 = 5'h1 == io_in_rs2_addr ? regs_1 : regs_0; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_34 = 5'h2 == io_in_rs2_addr ? regs_2 : _GEN_33; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_35 = 5'h3 == io_in_rs2_addr ? regs_3 : _GEN_34; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_36 = 5'h4 == io_in_rs2_addr ? regs_4 : _GEN_35; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_37 = 5'h5 == io_in_rs2_addr ? regs_5 : _GEN_36; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_38 = 5'h6 == io_in_rs2_addr ? regs_6 : _GEN_37; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_39 = 5'h7 == io_in_rs2_addr ? regs_7 : _GEN_38; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_40 = 5'h8 == io_in_rs2_addr ? regs_8 : _GEN_39; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_41 = 5'h9 == io_in_rs2_addr ? regs_9 : _GEN_40; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_42 = 5'ha == io_in_rs2_addr ? regs_10 : _GEN_41; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_43 = 5'hb == io_in_rs2_addr ? regs_11 : _GEN_42; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_44 = 5'hc == io_in_rs2_addr ? regs_12 : _GEN_43; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_45 = 5'hd == io_in_rs2_addr ? regs_13 : _GEN_44; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_46 = 5'he == io_in_rs2_addr ? regs_14 : _GEN_45; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_47 = 5'hf == io_in_rs2_addr ? regs_15 : _GEN_46; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_48 = 5'h10 == io_in_rs2_addr ? regs_16 : _GEN_47; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_49 = 5'h11 == io_in_rs2_addr ? regs_17 : _GEN_48; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_50 = 5'h12 == io_in_rs2_addr ? regs_18 : _GEN_49; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_51 = 5'h13 == io_in_rs2_addr ? regs_19 : _GEN_50; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_52 = 5'h14 == io_in_rs2_addr ? regs_20 : _GEN_51; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_53 = 5'h15 == io_in_rs2_addr ? regs_21 : _GEN_52; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_54 = 5'h16 == io_in_rs2_addr ? regs_22 : _GEN_53; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_55 = 5'h17 == io_in_rs2_addr ? regs_23 : _GEN_54; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_56 = 5'h18 == io_in_rs2_addr ? regs_24 : _GEN_55; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_57 = 5'h19 == io_in_rs2_addr ? regs_25 : _GEN_56; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_58 = 5'h1a == io_in_rs2_addr ? regs_26 : _GEN_57; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_59 = 5'h1b == io_in_rs2_addr ? regs_27 : _GEN_58; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_60 = 5'h1c == io_in_rs2_addr ? regs_28 : _GEN_59; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_61 = 5'h1d == io_in_rs2_addr ? regs_29 : _GEN_60; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_62 = 5'h1e == io_in_rs2_addr ? regs_30 : _GEN_61; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [31:0] _GEN_63 = 5'h1f == io_in_rs2_addr ? regs_31 : _GEN_62; // @[src/main/scala/npc/RegisterFile.scala 29:{27,27}]
  wire [11:0] _GEN_148 = {{1'd0}, io_in_csr_addr}; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _csr_idx_T_3 = 12'h305 == _GEN_148 ? 2'h1 : 2'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] _csr_idx_T_5 = 12'h341 == _GEN_148 ? 2'h2 : _csr_idx_T_3; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [1:0] csr_idx = 12'h342 == _GEN_148 ? 2'h3 : _csr_idx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _GEN_65 = 2'h1 == csr_idx ? csrs_1 : csrs_0; // @[src/main/scala/npc/RegisterFile.scala 43:{22,22}]
  wire [31:0] _GEN_66 = 2'h2 == csr_idx ? csrs_2 : _GEN_65; // @[src/main/scala/npc/RegisterFile.scala 43:{22,22}]
  wire [38:0] _GEN_152 = {{7'd0}, csrs_0}; // @[src/main/scala/npc/RegisterFile.scala 56:22]
  wire [38:0] _mstatus_mpie_T_1 = _GEN_152 & 39'h7fffffff7f; // @[src/main/scala/npc/RegisterFile.scala 56:22]
  wire [34:0] _GEN_153 = {{3'd0}, csrs_0}; // @[src/main/scala/npc/RegisterFile.scala 56:51]
  wire [34:0] _mstatus_mpie_T_2 = _GEN_153 & 35'h8; // @[src/main/scala/npc/RegisterFile.scala 56:51]
  wire [38:0] _mstatus_mpie_T_3 = {_mstatus_mpie_T_2, 4'h0}; // @[src/main/scala/npc/RegisterFile.scala 56:66]
  wire [38:0] mstatus_mpie = _mstatus_mpie_T_1 | _mstatus_mpie_T_3; // @[src/main/scala/npc/RegisterFile.scala 56:39]
  wire [38:0] mstatus_mie_cleared = mstatus_mpie & 39'h7fffffff7; // @[src/main/scala/npc/RegisterFile.scala 57:48]
  wire [42:0] _GEN_154 = {{4'd0}, mstatus_mie_cleared}; // @[src/main/scala/npc/RegisterFile.scala 59:34]
  wire [42:0] _mstatus_mpp_T_1 = _GEN_154 & 43'h7ffffffe7ff; // @[src/main/scala/npc/RegisterFile.scala 59:34]
  wire [42:0] mstatus_mpp = _mstatus_mpp_T_1 | 43'h1800; // @[src/main/scala/npc/RegisterFile.scala 59:55]
  wire [34:0] _mstatus_mie_T_1 = _GEN_153 & 35'h7fffffff7; // @[src/main/scala/npc/RegisterFile.scala 64:22]
  wire [38:0] _mstatus_mie_T_2 = _GEN_152 & 39'h80; // @[src/main/scala/npc/RegisterFile.scala 64:50]
  wire [34:0] mstatus_mie = _mstatus_mie_T_1 | _mstatus_mie_T_2[38:4]; // @[src/main/scala/npc/RegisterFile.scala 64:38]
  wire [38:0] _GEN_157 = {{4'd0}, mstatus_mie}; // @[src/main/scala/npc/RegisterFile.scala 65:40]
  wire [38:0] mstatus_mpie_1 = _GEN_157 | 39'h80; // @[src/main/scala/npc/RegisterFile.scala 65:40]
  wire [42:0] _GEN_158 = {{4'd0}, mstatus_mpie_1}; // @[src/main/scala/npc/RegisterFile.scala 66:42]
  wire [42:0] mstatus_final = _GEN_158 & 43'h7ffffffe7ff; // @[src/main/scala/npc/RegisterFile.scala 66:42]
  wire [31:0] _GEN_132 = 2'h0 == csr_idx ? io_in_csr_wdata : csrs_0; // @[src/main/scala/npc/RegisterFile.scala 25:23 69:{23,23}]
  wire [31:0] _GEN_133 = 2'h1 == csr_idx ? io_in_csr_wdata : csrs_1; // @[src/main/scala/npc/RegisterFile.scala 25:23 69:{23,23}]
  wire [31:0] _GEN_134 = 2'h2 == csr_idx ? io_in_csr_wdata : csrs_2; // @[src/main/scala/npc/RegisterFile.scala 25:23 69:{23,23}]
  wire [31:0] _GEN_135 = 2'h3 == csr_idx ? io_in_csr_wdata : csrs_3; // @[src/main/scala/npc/RegisterFile.scala 25:23 69:{23,23}]
  wire [31:0] _GEN_136 = io_in_csr_wen ? _GEN_132 : csrs_0; // @[src/main/scala/npc/RegisterFile.scala 25:23 68:31]
  wire [42:0] _GEN_140 = io_in_do_mret ? mstatus_final : {{11'd0}, _GEN_136}; // @[src/main/scala/npc/RegisterFile.scala 61:31 67:27]
  wire [42:0] _GEN_146 = io_in_do_ecall ? mstatus_mpp : _GEN_140; // @[src/main/scala/npc/RegisterFile.scala 51:26 60:27]
  wire [42:0] _GEN_159 = reset ? 43'h0 : _GEN_146; // @[src/main/scala/npc/RegisterFile.scala 25:{23,23}]
  assign io_out_rs1_data = io_in_rs1_addr == 5'h0 ? 32'h0 : _GEN_31; // @[src/main/scala/npc/RegisterFile.scala 28:27]
  assign io_out_rs2_data = io_in_rs2_addr == 5'h0 ? 32'h0 : _GEN_63; // @[src/main/scala/npc/RegisterFile.scala 29:27]
  assign io_out_csr_rdata = 2'h3 == csr_idx ? csrs_3 : _GEN_66; // @[src/main/scala/npc/RegisterFile.scala 43:{22,22}]
  assign io_out_ecall_mtvec = csrs_1; // @[src/main/scala/npc/RegisterFile.scala 73:24]
  assign io_out_mret_epc = csrs_2; // @[src/main/scala/npc/RegisterFile.scala 74:21]
  assign io_regs_out_0 = regs_0; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_1 = regs_1; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_2 = regs_2; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_3 = regs_3; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_4 = regs_4; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_5 = regs_5; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_6 = regs_6; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_7 = regs_7; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_8 = regs_8; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_9 = regs_9; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_10 = regs_10; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_11 = regs_11; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_12 = regs_12; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_13 = regs_13; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_14 = regs_14; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_15 = regs_15; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_16 = regs_16; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_17 = regs_17; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_18 = regs_18; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_19 = regs_19; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_20 = regs_20; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_21 = regs_21; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_22 = regs_22; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_23 = regs_23; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_24 = regs_24; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_25 = regs_25; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_26 = regs_26; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_27 = regs_27; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_28 = regs_28; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_29 = regs_29; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_30 = regs_30; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_regs_out_31 = regs_31; // @[src/main/scala/npc/RegisterFile.scala 76:17]
  assign io_csrs_out_0 = csrs_0; // @[src/main/scala/npc/RegisterFile.scala 77:17]
  assign io_csrs_out_1 = csrs_1; // @[src/main/scala/npc/RegisterFile.scala 77:17]
  assign io_csrs_out_2 = csrs_2; // @[src/main/scala/npc/RegisterFile.scala 77:17]
  assign io_csrs_out_3 = csrs_3; // @[src/main/scala/npc/RegisterFile.scala 77:17]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_0 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h0 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_0 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_1 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_1 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_2 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h2 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_2 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_3 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h3 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_3 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_4 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h4 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_4 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_5 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h5 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_5 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_6 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h6 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_6 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_7 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h7 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_7 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_8 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h8 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_8 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_9 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h9 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_9 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_10 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'ha == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_10 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_11 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'hb == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_11 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_12 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'hc == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_12 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_13 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'hd == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_13 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_14 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'he == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_14 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_15 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'hf == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_15 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_16 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h10 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_16 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_17 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h11 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_17 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_18 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h12 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_18 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_19 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h13 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_19 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_20 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h14 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_20 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_21 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h15 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_21 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_22 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h16 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_22 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_23 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h17 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_23 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_24 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h18 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_24 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_25 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h19 == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_25 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_26 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1a == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_26 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_27 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1b == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_27 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_28 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1c == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_28 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_29 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1d == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_29 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_30 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1e == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_30 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 24:23]
      regs_31 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 24:23]
    end else if (io_in_rd_wen & io_in_rd_addr != 5'h0) begin // @[src/main/scala/npc/RegisterFile.scala 46:51]
      if (5'h1f == io_in_rd_addr) begin // @[src/main/scala/npc/RegisterFile.scala 47:29]
        regs_31 <= io_in_rd_data; // @[src/main/scala/npc/RegisterFile.scala 47:29]
      end
    end
    csrs_0 <= _GEN_159[31:0]; // @[src/main/scala/npc/RegisterFile.scala 25:{23,23}]
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 25:23]
      csrs_1 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 25:23]
    end else if (!(io_in_do_ecall)) begin // @[src/main/scala/npc/RegisterFile.scala 51:26]
      if (!(io_in_do_mret)) begin // @[src/main/scala/npc/RegisterFile.scala 61:31]
        if (io_in_csr_wen) begin // @[src/main/scala/npc/RegisterFile.scala 68:31]
          csrs_1 <= _GEN_133;
        end
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 25:23]
      csrs_2 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 25:23]
    end else if (io_in_do_ecall) begin // @[src/main/scala/npc/RegisterFile.scala 51:26]
      csrs_2 <= io_in_ecall_epc; // @[src/main/scala/npc/RegisterFile.scala 53:24]
    end else if (!(io_in_do_mret)) begin // @[src/main/scala/npc/RegisterFile.scala 61:31]
      if (io_in_csr_wen) begin // @[src/main/scala/npc/RegisterFile.scala 68:31]
        csrs_2 <= _GEN_134;
      end
    end
    if (reset) begin // @[src/main/scala/npc/RegisterFile.scala 25:23]
      csrs_3 <= 32'h0; // @[src/main/scala/npc/RegisterFile.scala 25:23]
    end else if (io_in_do_ecall) begin // @[src/main/scala/npc/RegisterFile.scala 51:26]
      csrs_3 <= 32'hb; // @[src/main/scala/npc/RegisterFile.scala 52:26]
    end else if (!(io_in_do_mret)) begin // @[src/main/scala/npc/RegisterFile.scala 61:31]
      if (io_in_csr_wen) begin // @[src/main/scala/npc/RegisterFile.scala 68:31]
        csrs_3 <= _GEN_135;
      end
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
  regs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  csrs_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  csrs_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  csrs_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  csrs_3 = _RAND_35[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
