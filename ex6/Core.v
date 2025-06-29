module Core(
  input         clock,
  input         reset,
  output [31:0] io_imem_raddr, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_dmem_raddr, // @[src/main/scala/npc/Core.scala 72:16]
  output        io_dmem_valid, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_0, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_1, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_2, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_3, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_4, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_5, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_6, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_7, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_8, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_9, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_10, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_11, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_12, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_13, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_14, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_15, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_16, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_17, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_18, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_19, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_20, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_21, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_22, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_23, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_24, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_25, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_26, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_27, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_28, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_29, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_30, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_regs_31, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_csrs_0, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_csrs_1, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_csrs_2, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_csrs_3, // @[src/main/scala/npc/Core.scala 72:16]
  output        io_commit, // @[src/main/scala/npc/Core.scala 72:16]
  output [31:0] io_commit_pc // @[src/main/scala/npc/Core.scala 72:16]
);
  wire  imem_clock; // @[src/main/scala/npc/Core.scala 73:22]
  wire  imem_io_valid; // @[src/main/scala/npc/Core.scala 73:22]
  wire [31:0] imem_io_raddr; // @[src/main/scala/npc/Core.scala 73:22]
  wire [31:0] imem_io_rdata; // @[src/main/scala/npc/Core.scala 73:22]
  wire  dmem_clock; // @[src/main/scala/npc/Core.scala 74:22]
  wire  dmem_io_req_valid; // @[src/main/scala/npc/Core.scala 74:22]
  wire  dmem_io_req_wen; // @[src/main/scala/npc/Core.scala 74:22]
  wire [31:0] dmem_io_req_raddr; // @[src/main/scala/npc/Core.scala 74:22]
  wire [31:0] dmem_io_req_waddr; // @[src/main/scala/npc/Core.scala 74:22]
  wire [31:0] dmem_io_req_wdata; // @[src/main/scala/npc/Core.scala 74:22]
  wire [3:0] dmem_io_req_wmask; // @[src/main/scala/npc/Core.scala 74:22]
  wire [31:0] dmem_io_rdata; // @[src/main/scala/npc/Core.scala 74:22]
  wire  ifu_clock; // @[src/main/scala/npc/Core.scala 76:21]
  wire  ifu_reset; // @[src/main/scala/npc/Core.scala 76:21]
  wire  ifu_io_in_ready; // @[src/main/scala/npc/Core.scala 76:21]
  wire [31:0] ifu_io_in_bits_dnpc; // @[src/main/scala/npc/Core.scala 76:21]
  wire  ifu_io_in_bits_redirect; // @[src/main/scala/npc/Core.scala 76:21]
  wire [31:0] ifu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 76:21]
  wire [31:0] ifu_io_out_bits_inst; // @[src/main/scala/npc/Core.scala 76:21]
  wire  ifu_io_imem_valid; // @[src/main/scala/npc/Core.scala 76:21]
  wire [31:0] ifu_io_imem_raddr; // @[src/main/scala/npc/Core.scala 76:21]
  wire [31:0] ifu_io_imem_rdata; // @[src/main/scala/npc/Core.scala 76:21]
  wire [31:0] idu_io_in_bits_pc; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_in_bits_inst; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_inreg_rs1_data; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_inreg_rs2_data; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_inreg_csr_rdata; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_inreg_ecall_mtvec; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_inreg_mret_epc; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_imm_i; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_imm_s; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_imm_b; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_imm_u; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_imm_j; // @[src/main/scala/npc/Core.scala 77:21]
  wire [2:0] idu_io_out_bits_inst_type; // @[src/main/scala/npc/Core.scala 77:21]
  wire [5:0] idu_io_out_bits_inst_name; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 77:21]
  wire [4:0] idu_io_out_bits_rs1_addr; // @[src/main/scala/npc/Core.scala 77:21]
  wire [4:0] idu_io_out_bits_rs2_addr; // @[src/main/scala/npc/Core.scala 77:21]
  wire [4:0] idu_io_out_bits_rd_addr; // @[src/main/scala/npc/Core.scala 77:21]
  wire [10:0] idu_io_out_bits_csr_addr; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_rs1_data; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_rs2_data; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_mret_epc; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_ecall_mtvec; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] idu_io_out_bits_csr_rdata; // @[src/main/scala/npc/Core.scala 77:21]
  wire [31:0] exu_io_in_bits_imm_i; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_imm_s; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_imm_b; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_imm_u; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_imm_j; // @[src/main/scala/npc/Core.scala 78:21]
  wire [2:0] exu_io_in_bits_inst_type; // @[src/main/scala/npc/Core.scala 78:21]
  wire [5:0] exu_io_in_bits_inst_name; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_pc; // @[src/main/scala/npc/Core.scala 78:21]
  wire [4:0] exu_io_in_bits_rd_addr; // @[src/main/scala/npc/Core.scala 78:21]
  wire [10:0] exu_io_in_bits_csr_addr; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_rs1_data; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_rs2_data; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_mret_epc; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_ecall_mtvec; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_in_bits_csr_rdata; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_aluOut; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 78:21]
  wire [2:0] exu_io_out_bits_inst_type; // @[src/main/scala/npc/Core.scala 78:21]
  wire [5:0] exu_io_out_bits_inst_name; // @[src/main/scala/npc/Core.scala 78:21]
  wire [4:0] exu_io_out_bits_rd_addr; // @[src/main/scala/npc/Core.scala 78:21]
  wire [10:0] exu_io_out_bits_csr_addr; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_csrRdata; // @[src/main/scala/npc/Core.scala 78:21]
  wire  exu_io_out_bits_memValid; // @[src/main/scala/npc/Core.scala 78:21]
  wire  exu_io_out_bits_memWrite; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_memAddr; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_memWdata; // @[src/main/scala/npc/Core.scala 78:21]
  wire [3:0] exu_io_out_bits_memWmask; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_mret_epc; // @[src/main/scala/npc/Core.scala 78:21]
  wire  exu_io_out_bits_redirect; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] exu_io_out_bits_rs1_data; // @[src/main/scala/npc/Core.scala 78:21]
  wire [31:0] wbu_io_in_bits_aluOut; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_in_bits_pc; // @[src/main/scala/npc/Core.scala 79:21]
  wire [2:0] wbu_io_in_bits_inst_type; // @[src/main/scala/npc/Core.scala 79:21]
  wire [5:0] wbu_io_in_bits_inst_name; // @[src/main/scala/npc/Core.scala 79:21]
  wire [4:0] wbu_io_in_bits_rd_addr; // @[src/main/scala/npc/Core.scala 79:21]
  wire [10:0] wbu_io_in_bits_csr_addr; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_in_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_in_bits_mret_epc; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_in_bits_memRdata; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_in_bits_csrRdata; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_in_bits_redirect; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_in_bits_rs1_data; // @[src/main/scala/npc/Core.scala 79:21]
  wire [4:0] wbu_io_rfout_rd_addr; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_rfout_rd_data; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_rfout_rd_wen; // @[src/main/scala/npc/Core.scala 79:21]
  wire [10:0] wbu_io_rfout_csr_addr; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_rfout_csr_wdata; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_rfout_csr_wen; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_rfout_do_ecall; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_rfout_ecall_epc; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_rfout_do_mret; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_out_ready; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] wbu_io_out_bits_dnpc; // @[src/main/scala/npc/Core.scala 79:21]
  wire  wbu_io_out_bits_redirect; // @[src/main/scala/npc/Core.scala 79:21]
  wire [31:0] lsu_io_in_bits_aluOut; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_pc; // @[src/main/scala/npc/Core.scala 80:21]
  wire [2:0] lsu_io_in_bits_inst_type; // @[src/main/scala/npc/Core.scala 80:21]
  wire [5:0] lsu_io_in_bits_inst_name; // @[src/main/scala/npc/Core.scala 80:21]
  wire [4:0] lsu_io_in_bits_rd_addr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [10:0] lsu_io_in_bits_csr_addr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_csrRdata; // @[src/main/scala/npc/Core.scala 80:21]
  wire  lsu_io_in_bits_memValid; // @[src/main/scala/npc/Core.scala 80:21]
  wire  lsu_io_in_bits_memWrite; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_memAddr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_memWdata; // @[src/main/scala/npc/Core.scala 80:21]
  wire [3:0] lsu_io_in_bits_memWmask; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_mret_epc; // @[src/main/scala/npc/Core.scala 80:21]
  wire  lsu_io_in_bits_redirect; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_in_bits_rs1_data; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_aluOut; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 80:21]
  wire [2:0] lsu_io_out_bits_inst_type; // @[src/main/scala/npc/Core.scala 80:21]
  wire [5:0] lsu_io_out_bits_inst_name; // @[src/main/scala/npc/Core.scala 80:21]
  wire [4:0] lsu_io_out_bits_rd_addr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [10:0] lsu_io_out_bits_csr_addr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_mret_epc; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_memRdata; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_csrRdata; // @[src/main/scala/npc/Core.scala 80:21]
  wire  lsu_io_out_bits_redirect; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_out_bits_rs1_data; // @[src/main/scala/npc/Core.scala 80:21]
  wire  lsu_io_dmem_req_valid; // @[src/main/scala/npc/Core.scala 80:21]
  wire  lsu_io_dmem_req_wen; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_dmem_req_raddr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_dmem_req_waddr; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_dmem_req_wdata; // @[src/main/scala/npc/Core.scala 80:21]
  wire [3:0] lsu_io_dmem_req_wmask; // @[src/main/scala/npc/Core.scala 80:21]
  wire [31:0] lsu_io_dmem_rdata; // @[src/main/scala/npc/Core.scala 80:21]
  wire  rf_clock; // @[src/main/scala/npc/Core.scala 81:20]
  wire  rf_reset; // @[src/main/scala/npc/Core.scala 81:20]
  wire [4:0] rf_io_in_rs1_addr; // @[src/main/scala/npc/Core.scala 81:20]
  wire [4:0] rf_io_in_rs2_addr; // @[src/main/scala/npc/Core.scala 81:20]
  wire [4:0] rf_io_in_rd_addr; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_in_rd_data; // @[src/main/scala/npc/Core.scala 81:20]
  wire  rf_io_in_rd_wen; // @[src/main/scala/npc/Core.scala 81:20]
  wire [10:0] rf_io_in_csr_addr; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_in_csr_wdata; // @[src/main/scala/npc/Core.scala 81:20]
  wire  rf_io_in_csr_wen; // @[src/main/scala/npc/Core.scala 81:20]
  wire  rf_io_in_do_ecall; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_in_ecall_epc; // @[src/main/scala/npc/Core.scala 81:20]
  wire  rf_io_in_do_mret; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_out_rs1_data; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_out_rs2_data; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_out_csr_rdata; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_out_ecall_mtvec; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_out_mret_epc; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_0; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_1; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_2; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_3; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_4; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_5; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_6; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_7; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_8; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_9; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_10; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_11; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_12; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_13; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_14; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_15; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_16; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_17; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_18; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_19; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_20; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_21; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_22; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_23; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_24; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_25; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_26; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_27; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_28; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_29; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_30; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_regs_out_31; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_csrs_out_0; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_csrs_out_1; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_csrs_out_2; // @[src/main/scala/npc/Core.scala 81:20]
  wire [31:0] rf_io_csrs_out_3; // @[src/main/scala/npc/Core.scala 81:20]
  Imem imem ( // @[src/main/scala/npc/Core.scala 73:22]
    .clock(imem_clock),
    .io_valid(imem_io_valid),
    .io_raddr(imem_io_raddr),
    .io_rdata(imem_io_rdata)
  );
  Dmem dmem ( // @[src/main/scala/npc/Core.scala 74:22]
    .clock(dmem_clock),
    .io_req_valid(dmem_io_req_valid),
    .io_req_wen(dmem_io_req_wen),
    .io_req_raddr(dmem_io_req_raddr),
    .io_req_waddr(dmem_io_req_waddr),
    .io_req_wdata(dmem_io_req_wdata),
    .io_req_wmask(dmem_io_req_wmask),
    .io_rdata(dmem_io_rdata)
  );
  IFU ifu ( // @[src/main/scala/npc/Core.scala 76:21]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_in_ready(ifu_io_in_ready),
    .io_in_bits_dnpc(ifu_io_in_bits_dnpc),
    .io_in_bits_redirect(ifu_io_in_bits_redirect),
    .io_out_bits_pc(ifu_io_out_bits_pc),
    .io_out_bits_inst(ifu_io_out_bits_inst),
    .io_imem_valid(ifu_io_imem_valid),
    .io_imem_raddr(ifu_io_imem_raddr),
    .io_imem_rdata(ifu_io_imem_rdata)
  );
  IDU idu ( // @[src/main/scala/npc/Core.scala 77:21]
    .io_in_bits_pc(idu_io_in_bits_pc),
    .io_in_bits_inst(idu_io_in_bits_inst),
    .io_inreg_rs1_data(idu_io_inreg_rs1_data),
    .io_inreg_rs2_data(idu_io_inreg_rs2_data),
    .io_inreg_csr_rdata(idu_io_inreg_csr_rdata),
    .io_inreg_ecall_mtvec(idu_io_inreg_ecall_mtvec),
    .io_inreg_mret_epc(idu_io_inreg_mret_epc),
    .io_out_bits_imm_i(idu_io_out_bits_imm_i),
    .io_out_bits_imm_s(idu_io_out_bits_imm_s),
    .io_out_bits_imm_b(idu_io_out_bits_imm_b),
    .io_out_bits_imm_u(idu_io_out_bits_imm_u),
    .io_out_bits_imm_j(idu_io_out_bits_imm_j),
    .io_out_bits_inst_type(idu_io_out_bits_inst_type),
    .io_out_bits_inst_name(idu_io_out_bits_inst_name),
    .io_out_bits_pc(idu_io_out_bits_pc),
    .io_out_bits_rs1_addr(idu_io_out_bits_rs1_addr),
    .io_out_bits_rs2_addr(idu_io_out_bits_rs2_addr),
    .io_out_bits_rd_addr(idu_io_out_bits_rd_addr),
    .io_out_bits_csr_addr(idu_io_out_bits_csr_addr),
    .io_out_bits_rs1_data(idu_io_out_bits_rs1_data),
    .io_out_bits_rs2_data(idu_io_out_bits_rs2_data),
    .io_out_bits_ecall_epc(idu_io_out_bits_ecall_epc),
    .io_out_bits_mret_epc(idu_io_out_bits_mret_epc),
    .io_out_bits_ecall_mtvec(idu_io_out_bits_ecall_mtvec),
    .io_out_bits_csr_rdata(idu_io_out_bits_csr_rdata)
  );
  EXU exu ( // @[src/main/scala/npc/Core.scala 78:21]
    .io_in_bits_imm_i(exu_io_in_bits_imm_i),
    .io_in_bits_imm_s(exu_io_in_bits_imm_s),
    .io_in_bits_imm_b(exu_io_in_bits_imm_b),
    .io_in_bits_imm_u(exu_io_in_bits_imm_u),
    .io_in_bits_imm_j(exu_io_in_bits_imm_j),
    .io_in_bits_inst_type(exu_io_in_bits_inst_type),
    .io_in_bits_inst_name(exu_io_in_bits_inst_name),
    .io_in_bits_pc(exu_io_in_bits_pc),
    .io_in_bits_rd_addr(exu_io_in_bits_rd_addr),
    .io_in_bits_csr_addr(exu_io_in_bits_csr_addr),
    .io_in_bits_rs1_data(exu_io_in_bits_rs1_data),
    .io_in_bits_rs2_data(exu_io_in_bits_rs2_data),
    .io_in_bits_ecall_epc(exu_io_in_bits_ecall_epc),
    .io_in_bits_mret_epc(exu_io_in_bits_mret_epc),
    .io_in_bits_ecall_mtvec(exu_io_in_bits_ecall_mtvec),
    .io_in_bits_csr_rdata(exu_io_in_bits_csr_rdata),
    .io_out_bits_aluOut(exu_io_out_bits_aluOut),
    .io_out_bits_pc(exu_io_out_bits_pc),
    .io_out_bits_inst_type(exu_io_out_bits_inst_type),
    .io_out_bits_inst_name(exu_io_out_bits_inst_name),
    .io_out_bits_rd_addr(exu_io_out_bits_rd_addr),
    .io_out_bits_csr_addr(exu_io_out_bits_csr_addr),
    .io_out_bits_csrRdata(exu_io_out_bits_csrRdata),
    .io_out_bits_memValid(exu_io_out_bits_memValid),
    .io_out_bits_memWrite(exu_io_out_bits_memWrite),
    .io_out_bits_memAddr(exu_io_out_bits_memAddr),
    .io_out_bits_memWdata(exu_io_out_bits_memWdata),
    .io_out_bits_memWmask(exu_io_out_bits_memWmask),
    .io_out_bits_ecall_epc(exu_io_out_bits_ecall_epc),
    .io_out_bits_mret_epc(exu_io_out_bits_mret_epc),
    .io_out_bits_redirect(exu_io_out_bits_redirect),
    .io_out_bits_rs1_data(exu_io_out_bits_rs1_data)
  );
  WBU wbu ( // @[src/main/scala/npc/Core.scala 79:21]
    .io_in_bits_aluOut(wbu_io_in_bits_aluOut),
    .io_in_bits_pc(wbu_io_in_bits_pc),
    .io_in_bits_inst_type(wbu_io_in_bits_inst_type),
    .io_in_bits_inst_name(wbu_io_in_bits_inst_name),
    .io_in_bits_rd_addr(wbu_io_in_bits_rd_addr),
    .io_in_bits_csr_addr(wbu_io_in_bits_csr_addr),
    .io_in_bits_ecall_epc(wbu_io_in_bits_ecall_epc),
    .io_in_bits_mret_epc(wbu_io_in_bits_mret_epc),
    .io_in_bits_memRdata(wbu_io_in_bits_memRdata),
    .io_in_bits_csrRdata(wbu_io_in_bits_csrRdata),
    .io_in_bits_redirect(wbu_io_in_bits_redirect),
    .io_in_bits_rs1_data(wbu_io_in_bits_rs1_data),
    .io_rfout_rd_addr(wbu_io_rfout_rd_addr),
    .io_rfout_rd_data(wbu_io_rfout_rd_data),
    .io_rfout_rd_wen(wbu_io_rfout_rd_wen),
    .io_rfout_csr_addr(wbu_io_rfout_csr_addr),
    .io_rfout_csr_wdata(wbu_io_rfout_csr_wdata),
    .io_rfout_csr_wen(wbu_io_rfout_csr_wen),
    .io_rfout_do_ecall(wbu_io_rfout_do_ecall),
    .io_rfout_ecall_epc(wbu_io_rfout_ecall_epc),
    .io_rfout_do_mret(wbu_io_rfout_do_mret),
    .io_out_ready(wbu_io_out_ready),
    .io_out_bits_dnpc(wbu_io_out_bits_dnpc),
    .io_out_bits_redirect(wbu_io_out_bits_redirect)
  );
  LSU lsu ( // @[src/main/scala/npc/Core.scala 80:21]
    .io_in_bits_aluOut(lsu_io_in_bits_aluOut),
    .io_in_bits_pc(lsu_io_in_bits_pc),
    .io_in_bits_inst_type(lsu_io_in_bits_inst_type),
    .io_in_bits_inst_name(lsu_io_in_bits_inst_name),
    .io_in_bits_rd_addr(lsu_io_in_bits_rd_addr),
    .io_in_bits_csr_addr(lsu_io_in_bits_csr_addr),
    .io_in_bits_csrRdata(lsu_io_in_bits_csrRdata),
    .io_in_bits_memValid(lsu_io_in_bits_memValid),
    .io_in_bits_memWrite(lsu_io_in_bits_memWrite),
    .io_in_bits_memAddr(lsu_io_in_bits_memAddr),
    .io_in_bits_memWdata(lsu_io_in_bits_memWdata),
    .io_in_bits_memWmask(lsu_io_in_bits_memWmask),
    .io_in_bits_ecall_epc(lsu_io_in_bits_ecall_epc),
    .io_in_bits_mret_epc(lsu_io_in_bits_mret_epc),
    .io_in_bits_redirect(lsu_io_in_bits_redirect),
    .io_in_bits_rs1_data(lsu_io_in_bits_rs1_data),
    .io_out_bits_aluOut(lsu_io_out_bits_aluOut),
    .io_out_bits_pc(lsu_io_out_bits_pc),
    .io_out_bits_inst_type(lsu_io_out_bits_inst_type),
    .io_out_bits_inst_name(lsu_io_out_bits_inst_name),
    .io_out_bits_rd_addr(lsu_io_out_bits_rd_addr),
    .io_out_bits_csr_addr(lsu_io_out_bits_csr_addr),
    .io_out_bits_ecall_epc(lsu_io_out_bits_ecall_epc),
    .io_out_bits_mret_epc(lsu_io_out_bits_mret_epc),
    .io_out_bits_memRdata(lsu_io_out_bits_memRdata),
    .io_out_bits_csrRdata(lsu_io_out_bits_csrRdata),
    .io_out_bits_redirect(lsu_io_out_bits_redirect),
    .io_out_bits_rs1_data(lsu_io_out_bits_rs1_data),
    .io_dmem_req_valid(lsu_io_dmem_req_valid),
    .io_dmem_req_wen(lsu_io_dmem_req_wen),
    .io_dmem_req_raddr(lsu_io_dmem_req_raddr),
    .io_dmem_req_waddr(lsu_io_dmem_req_waddr),
    .io_dmem_req_wdata(lsu_io_dmem_req_wdata),
    .io_dmem_req_wmask(lsu_io_dmem_req_wmask),
    .io_dmem_rdata(lsu_io_dmem_rdata)
  );
  RegisterFile rf ( // @[src/main/scala/npc/Core.scala 81:20]
    .clock(rf_clock),
    .reset(rf_reset),
    .io_in_rs1_addr(rf_io_in_rs1_addr),
    .io_in_rs2_addr(rf_io_in_rs2_addr),
    .io_in_rd_addr(rf_io_in_rd_addr),
    .io_in_rd_data(rf_io_in_rd_data),
    .io_in_rd_wen(rf_io_in_rd_wen),
    .io_in_csr_addr(rf_io_in_csr_addr),
    .io_in_csr_wdata(rf_io_in_csr_wdata),
    .io_in_csr_wen(rf_io_in_csr_wen),
    .io_in_do_ecall(rf_io_in_do_ecall),
    .io_in_ecall_epc(rf_io_in_ecall_epc),
    .io_in_do_mret(rf_io_in_do_mret),
    .io_out_rs1_data(rf_io_out_rs1_data),
    .io_out_rs2_data(rf_io_out_rs2_data),
    .io_out_csr_rdata(rf_io_out_csr_rdata),
    .io_out_ecall_mtvec(rf_io_out_ecall_mtvec),
    .io_out_mret_epc(rf_io_out_mret_epc),
    .io_regs_out_0(rf_io_regs_out_0),
    .io_regs_out_1(rf_io_regs_out_1),
    .io_regs_out_2(rf_io_regs_out_2),
    .io_regs_out_3(rf_io_regs_out_3),
    .io_regs_out_4(rf_io_regs_out_4),
    .io_regs_out_5(rf_io_regs_out_5),
    .io_regs_out_6(rf_io_regs_out_6),
    .io_regs_out_7(rf_io_regs_out_7),
    .io_regs_out_8(rf_io_regs_out_8),
    .io_regs_out_9(rf_io_regs_out_9),
    .io_regs_out_10(rf_io_regs_out_10),
    .io_regs_out_11(rf_io_regs_out_11),
    .io_regs_out_12(rf_io_regs_out_12),
    .io_regs_out_13(rf_io_regs_out_13),
    .io_regs_out_14(rf_io_regs_out_14),
    .io_regs_out_15(rf_io_regs_out_15),
    .io_regs_out_16(rf_io_regs_out_16),
    .io_regs_out_17(rf_io_regs_out_17),
    .io_regs_out_18(rf_io_regs_out_18),
    .io_regs_out_19(rf_io_regs_out_19),
    .io_regs_out_20(rf_io_regs_out_20),
    .io_regs_out_21(rf_io_regs_out_21),
    .io_regs_out_22(rf_io_regs_out_22),
    .io_regs_out_23(rf_io_regs_out_23),
    .io_regs_out_24(rf_io_regs_out_24),
    .io_regs_out_25(rf_io_regs_out_25),
    .io_regs_out_26(rf_io_regs_out_26),
    .io_regs_out_27(rf_io_regs_out_27),
    .io_regs_out_28(rf_io_regs_out_28),
    .io_regs_out_29(rf_io_regs_out_29),
    .io_regs_out_30(rf_io_regs_out_30),
    .io_regs_out_31(rf_io_regs_out_31),
    .io_csrs_out_0(rf_io_csrs_out_0),
    .io_csrs_out_1(rf_io_csrs_out_1),
    .io_csrs_out_2(rf_io_csrs_out_2),
    .io_csrs_out_3(rf_io_csrs_out_3)
  );
  assign io_imem_raddr = ifu_io_imem_raddr; // @[src/main/scala/npc/Core.scala 122:19]
  assign io_dmem_raddr = lsu_io_dmem_req_raddr; // @[src/main/scala/npc/Core.scala 123:19]
  assign io_dmem_valid = lsu_io_dmem_req_valid; // @[src/main/scala/npc/Core.scala 124:19]
  assign io_regs_0 = rf_io_regs_out_0; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_1 = rf_io_regs_out_1; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_2 = rf_io_regs_out_2; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_3 = rf_io_regs_out_3; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_4 = rf_io_regs_out_4; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_5 = rf_io_regs_out_5; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_6 = rf_io_regs_out_6; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_7 = rf_io_regs_out_7; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_8 = rf_io_regs_out_8; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_9 = rf_io_regs_out_9; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_10 = rf_io_regs_out_10; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_11 = rf_io_regs_out_11; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_12 = rf_io_regs_out_12; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_13 = rf_io_regs_out_13; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_14 = rf_io_regs_out_14; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_15 = rf_io_regs_out_15; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_16 = rf_io_regs_out_16; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_17 = rf_io_regs_out_17; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_18 = rf_io_regs_out_18; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_19 = rf_io_regs_out_19; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_20 = rf_io_regs_out_20; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_21 = rf_io_regs_out_21; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_22 = rf_io_regs_out_22; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_23 = rf_io_regs_out_23; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_24 = rf_io_regs_out_24; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_25 = rf_io_regs_out_25; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_26 = rf_io_regs_out_26; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_27 = rf_io_regs_out_27; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_28 = rf_io_regs_out_28; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_29 = rf_io_regs_out_29; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_30 = rf_io_regs_out_30; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_regs_31 = rf_io_regs_out_31; // @[src/main/scala/npc/Core.scala 82:13]
  assign io_csrs_0 = rf_io_csrs_out_0; // @[src/main/scala/npc/Core.scala 83:13]
  assign io_csrs_1 = rf_io_csrs_out_1; // @[src/main/scala/npc/Core.scala 83:13]
  assign io_csrs_2 = rf_io_csrs_out_2; // @[src/main/scala/npc/Core.scala 83:13]
  assign io_csrs_3 = rf_io_csrs_out_3; // @[src/main/scala/npc/Core.scala 83:13]
  assign io_commit = wbu_io_out_ready; // @[src/main/scala/npc/Core.scala 106:35]
  assign io_commit_pc = wbu_io_rfout_ecall_epc; // @[src/main/scala/npc/Core.scala 107:18]
  assign imem_clock = clock;
  assign imem_io_valid = ifu_io_imem_valid; // @[src/main/scala/npc/Core.scala 84:13]
  assign imem_io_raddr = ifu_io_imem_raddr; // @[src/main/scala/npc/Core.scala 84:13]
  assign dmem_clock = clock;
  assign dmem_io_req_valid = lsu_io_dmem_req_valid; // @[src/main/scala/npc/Core.scala 85:13]
  assign dmem_io_req_wen = lsu_io_dmem_req_wen; // @[src/main/scala/npc/Core.scala 85:13]
  assign dmem_io_req_raddr = lsu_io_dmem_req_raddr; // @[src/main/scala/npc/Core.scala 85:13]
  assign dmem_io_req_waddr = lsu_io_dmem_req_waddr; // @[src/main/scala/npc/Core.scala 85:13]
  assign dmem_io_req_wdata = lsu_io_dmem_req_wdata; // @[src/main/scala/npc/Core.scala 85:13]
  assign dmem_io_req_wmask = lsu_io_dmem_req_wmask; // @[src/main/scala/npc/Core.scala 85:13]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_in_bits_dnpc = wbu_io_out_bits_dnpc; // @[src/main/scala/npc/Core.scala 25:28]
  assign ifu_io_in_bits_redirect = wbu_io_out_bits_redirect; // @[src/main/scala/npc/Core.scala 25:28]
  assign ifu_io_imem_rdata = imem_io_rdata; // @[src/main/scala/npc/Core.scala 84:13]
  assign idu_io_in_bits_pc = ifu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 25:28]
  assign idu_io_in_bits_inst = ifu_io_out_bits_inst; // @[src/main/scala/npc/Core.scala 25:28]
  assign idu_io_inreg_rs1_data = rf_io_out_rs1_data; // @[src/main/scala/npc/Core.scala 97:17]
  assign idu_io_inreg_rs2_data = rf_io_out_rs2_data; // @[src/main/scala/npc/Core.scala 97:17]
  assign idu_io_inreg_csr_rdata = rf_io_out_csr_rdata; // @[src/main/scala/npc/Core.scala 97:17]
  assign idu_io_inreg_ecall_mtvec = rf_io_out_ecall_mtvec; // @[src/main/scala/npc/Core.scala 97:17]
  assign idu_io_inreg_mret_epc = rf_io_out_mret_epc; // @[src/main/scala/npc/Core.scala 97:17]
  assign exu_io_in_bits_imm_i = idu_io_out_bits_imm_i; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_imm_s = idu_io_out_bits_imm_s; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_imm_b = idu_io_out_bits_imm_b; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_imm_u = idu_io_out_bits_imm_u; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_imm_j = idu_io_out_bits_imm_j; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_inst_type = idu_io_out_bits_inst_type; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_inst_name = idu_io_out_bits_inst_name; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_pc = idu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_rd_addr = idu_io_out_bits_rd_addr; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_csr_addr = idu_io_out_bits_csr_addr; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_rs1_data = idu_io_out_bits_rs1_data; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_rs2_data = idu_io_out_bits_rs2_data; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_ecall_epc = idu_io_out_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_mret_epc = idu_io_out_bits_mret_epc; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_ecall_mtvec = idu_io_out_bits_ecall_mtvec; // @[src/main/scala/npc/Core.scala 25:28]
  assign exu_io_in_bits_csr_rdata = idu_io_out_bits_csr_rdata; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_aluOut = lsu_io_out_bits_aluOut; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_pc = lsu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_inst_type = lsu_io_out_bits_inst_type; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_inst_name = lsu_io_out_bits_inst_name; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_rd_addr = lsu_io_out_bits_rd_addr; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_csr_addr = lsu_io_out_bits_csr_addr; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_ecall_epc = lsu_io_out_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_mret_epc = lsu_io_out_bits_mret_epc; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_memRdata = lsu_io_out_bits_memRdata; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_csrRdata = lsu_io_out_bits_csrRdata; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_redirect = lsu_io_out_bits_redirect; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_in_bits_rs1_data = lsu_io_out_bits_rs1_data; // @[src/main/scala/npc/Core.scala 25:28]
  assign wbu_io_out_ready = 1'h1; // @[src/main/scala/npc/Core.scala 26:28]
  assign lsu_io_in_bits_aluOut = exu_io_out_bits_aluOut; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_pc = exu_io_out_bits_pc; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_inst_type = exu_io_out_bits_inst_type; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_inst_name = exu_io_out_bits_inst_name; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_rd_addr = exu_io_out_bits_rd_addr; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_csr_addr = exu_io_out_bits_csr_addr; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_csrRdata = exu_io_out_bits_csrRdata; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_memValid = exu_io_out_bits_memValid; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_memWrite = exu_io_out_bits_memWrite; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_memAddr = exu_io_out_bits_memAddr; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_memWdata = exu_io_out_bits_memWdata; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_memWmask = exu_io_out_bits_memWmask; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_ecall_epc = exu_io_out_bits_ecall_epc; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_mret_epc = exu_io_out_bits_mret_epc; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_redirect = exu_io_out_bits_redirect; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_in_bits_rs1_data = exu_io_out_bits_rs1_data; // @[src/main/scala/npc/Core.scala 25:28]
  assign lsu_io_dmem_rdata = dmem_io_rdata; // @[src/main/scala/npc/Core.scala 85:13]
  assign rf_clock = clock;
  assign rf_reset = reset;
  assign rf_io_in_rs1_addr = idu_io_out_bits_rs1_addr; // @[src/main/scala/npc/Core.scala 89:23]
  assign rf_io_in_rs2_addr = idu_io_out_bits_rs2_addr; // @[src/main/scala/npc/Core.scala 90:23]
  assign rf_io_in_rd_addr = wbu_io_rfout_rd_addr; // @[src/main/scala/npc/Core.scala 108:22]
  assign rf_io_in_rd_data = wbu_io_rfout_rd_data; // @[src/main/scala/npc/Core.scala 109:22]
  assign rf_io_in_rd_wen = wbu_io_rfout_rd_wen; // @[src/main/scala/npc/Core.scala 110:21]
  assign rf_io_in_csr_addr = wbu_io_rfout_csr_addr; // @[src/main/scala/npc/Core.scala 111:23]
  assign rf_io_in_csr_wdata = wbu_io_rfout_csr_wdata; // @[src/main/scala/npc/Core.scala 113:24]
  assign rf_io_in_csr_wen = wbu_io_rfout_csr_wen; // @[src/main/scala/npc/Core.scala 114:22]
  assign rf_io_in_do_ecall = wbu_io_rfout_do_ecall; // @[src/main/scala/npc/Core.scala 115:23]
  assign rf_io_in_ecall_epc = wbu_io_rfout_ecall_epc; // @[src/main/scala/npc/Core.scala 117:24]
  assign rf_io_in_do_mret = wbu_io_rfout_do_mret; // @[src/main/scala/npc/Core.scala 118:22]
endmodule
