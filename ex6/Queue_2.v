module Queue_2(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_aluOut, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_pc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [2:0]  io_enq_bits_inst_type, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [5:0]  io_enq_bits_inst_name, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [4:0]  io_enq_bits_rs1_addr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [4:0]  io_enq_bits_rd_addr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [10:0] io_enq_bits_csr_addr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_csrRdata, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_bits_memValid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_bits_memWrite, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_memAddr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_memWdata, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [3:0]  io_enq_bits_memWmask, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_ecall_epc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_mret_epc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [31:0] io_enq_bits_dnpc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_bits_redirect, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_aluOut, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_pc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [2:0]  io_deq_bits_inst_type, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [5:0]  io_deq_bits_inst_name, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [4:0]  io_deq_bits_rs1_addr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [4:0]  io_deq_bits_rd_addr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [10:0] io_deq_bits_csr_addr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_csrRdata, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_bits_memValid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_bits_memWrite, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_memAddr, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_memWdata, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [3:0]  io_deq_bits_memWmask, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_ecall_epc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_mret_epc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [31:0] io_deq_bits_dnpc, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_bits_redirect // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
);
`ifdef RANDOMIZE_MEM_INIT
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
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_aluOut [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_aluOut_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_aluOut_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_aluOut_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_aluOut_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_aluOut_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_aluOut_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_aluOut_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_pc [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_pc_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_pc_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_pc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_pc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_pc_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_pc_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_pc_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [2:0] ram_inst_type [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_type_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_type_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [2:0] ram_inst_type_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [2:0] ram_inst_type_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_type_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_type_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_type_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [5:0] ram_inst_name [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_name_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_name_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [5:0] ram_inst_name_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [5:0] ram_inst_name_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_name_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_name_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_inst_name_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [4:0] ram_rs1_addr [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rs1_addr_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rs1_addr_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [4:0] ram_rs1_addr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [4:0] ram_rs1_addr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rs1_addr_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rs1_addr_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rs1_addr_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [4:0] ram_rd_addr [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rd_addr_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rd_addr_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [4:0] ram_rd_addr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [4:0] ram_rd_addr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rd_addr_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rd_addr_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_rd_addr_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [10:0] ram_csr_addr [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csr_addr_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csr_addr_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [10:0] ram_csr_addr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [10:0] ram_csr_addr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csr_addr_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csr_addr_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csr_addr_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_csrRdata [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csrRdata_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csrRdata_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_csrRdata_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_csrRdata_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csrRdata_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csrRdata_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_csrRdata_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  ram_memValid [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memValid_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  ram_memWrite [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWrite_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_memAddr [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memAddr_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memAddr_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_memAddr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_memAddr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memAddr_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memAddr_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memAddr_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_memWdata [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWdata_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWdata_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_memWdata_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_memWdata_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWdata_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWdata_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWdata_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [3:0] ram_memWmask [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWmask_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWmask_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [3:0] ram_memWmask_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [3:0] ram_memWmask_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWmask_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWmask_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_memWmask_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_ecall_epc [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_ecall_epc_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_ecall_epc_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_ecall_epc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_ecall_epc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_ecall_epc_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_ecall_epc_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_ecall_epc_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_mret_epc [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_mret_epc_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_mret_epc_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_mret_epc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_mret_epc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_mret_epc_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_mret_epc_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_mret_epc_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [31:0] ram_dnpc [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_dnpc_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_dnpc_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_dnpc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [31:0] ram_dnpc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_dnpc_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_dnpc_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_dnpc_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  ram_redirect [0:0]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_redirect_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
  wire  empty = ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 284:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  assign ram_aluOut_io_deq_bits_MPORT_en = 1'h1;
  assign ram_aluOut_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_aluOut_io_deq_bits_MPORT_data = ram_aluOut[ram_aluOut_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_aluOut_MPORT_data = io_enq_bits_aluOut;
  assign ram_aluOut_MPORT_addr = 1'h0;
  assign ram_aluOut_MPORT_mask = 1'h1;
  assign ram_aluOut_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_pc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_pc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_pc_io_deq_bits_MPORT_data = ram_pc[ram_pc_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_pc_MPORT_data = io_enq_bits_pc;
  assign ram_pc_MPORT_addr = 1'h0;
  assign ram_pc_MPORT_mask = 1'h1;
  assign ram_pc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_inst_type_io_deq_bits_MPORT_en = 1'h1;
  assign ram_inst_type_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_inst_type_io_deq_bits_MPORT_data = ram_inst_type[ram_inst_type_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_inst_type_MPORT_data = io_enq_bits_inst_type;
  assign ram_inst_type_MPORT_addr = 1'h0;
  assign ram_inst_type_MPORT_mask = 1'h1;
  assign ram_inst_type_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_inst_name_io_deq_bits_MPORT_en = 1'h1;
  assign ram_inst_name_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_inst_name_io_deq_bits_MPORT_data = ram_inst_name[ram_inst_name_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_inst_name_MPORT_data = io_enq_bits_inst_name;
  assign ram_inst_name_MPORT_addr = 1'h0;
  assign ram_inst_name_MPORT_mask = 1'h1;
  assign ram_inst_name_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_rs1_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rs1_addr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_rs1_addr_io_deq_bits_MPORT_data = ram_rs1_addr[ram_rs1_addr_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_rs1_addr_MPORT_data = io_enq_bits_rs1_addr;
  assign ram_rs1_addr_MPORT_addr = 1'h0;
  assign ram_rs1_addr_MPORT_mask = 1'h1;
  assign ram_rs1_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_rd_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rd_addr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_rd_addr_io_deq_bits_MPORT_data = ram_rd_addr[ram_rd_addr_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_rd_addr_MPORT_data = io_enq_bits_rd_addr;
  assign ram_rd_addr_MPORT_addr = 1'h0;
  assign ram_rd_addr_MPORT_mask = 1'h1;
  assign ram_rd_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_csr_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_csr_addr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_csr_addr_io_deq_bits_MPORT_data = ram_csr_addr[ram_csr_addr_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_csr_addr_MPORT_data = io_enq_bits_csr_addr;
  assign ram_csr_addr_MPORT_addr = 1'h0;
  assign ram_csr_addr_MPORT_mask = 1'h1;
  assign ram_csr_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_csrRdata_io_deq_bits_MPORT_en = 1'h1;
  assign ram_csrRdata_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_csrRdata_io_deq_bits_MPORT_data = ram_csrRdata[ram_csrRdata_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_csrRdata_MPORT_data = io_enq_bits_csrRdata;
  assign ram_csrRdata_MPORT_addr = 1'h0;
  assign ram_csrRdata_MPORT_mask = 1'h1;
  assign ram_csrRdata_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_memValid_io_deq_bits_MPORT_en = 1'h1;
  assign ram_memValid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_memValid_io_deq_bits_MPORT_data = ram_memValid[ram_memValid_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_memValid_MPORT_data = io_enq_bits_memValid;
  assign ram_memValid_MPORT_addr = 1'h0;
  assign ram_memValid_MPORT_mask = 1'h1;
  assign ram_memValid_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_memWrite_io_deq_bits_MPORT_en = 1'h1;
  assign ram_memWrite_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_memWrite_io_deq_bits_MPORT_data = ram_memWrite[ram_memWrite_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_memWrite_MPORT_data = io_enq_bits_memWrite;
  assign ram_memWrite_MPORT_addr = 1'h0;
  assign ram_memWrite_MPORT_mask = 1'h1;
  assign ram_memWrite_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_memAddr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_memAddr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_memAddr_io_deq_bits_MPORT_data = ram_memAddr[ram_memAddr_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_memAddr_MPORT_data = io_enq_bits_memAddr;
  assign ram_memAddr_MPORT_addr = 1'h0;
  assign ram_memAddr_MPORT_mask = 1'h1;
  assign ram_memAddr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_memWdata_io_deq_bits_MPORT_en = 1'h1;
  assign ram_memWdata_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_memWdata_io_deq_bits_MPORT_data = ram_memWdata[ram_memWdata_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_memWdata_MPORT_data = io_enq_bits_memWdata;
  assign ram_memWdata_MPORT_addr = 1'h0;
  assign ram_memWdata_MPORT_mask = 1'h1;
  assign ram_memWdata_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_memWmask_io_deq_bits_MPORT_en = 1'h1;
  assign ram_memWmask_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_memWmask_io_deq_bits_MPORT_data = ram_memWmask[ram_memWmask_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_memWmask_MPORT_data = io_enq_bits_memWmask;
  assign ram_memWmask_MPORT_addr = 1'h0;
  assign ram_memWmask_MPORT_mask = 1'h1;
  assign ram_memWmask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ecall_epc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_ecall_epc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ecall_epc_io_deq_bits_MPORT_data = ram_ecall_epc[ram_ecall_epc_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_ecall_epc_MPORT_data = io_enq_bits_ecall_epc;
  assign ram_ecall_epc_MPORT_addr = 1'h0;
  assign ram_ecall_epc_MPORT_mask = 1'h1;
  assign ram_ecall_epc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_mret_epc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_mret_epc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_mret_epc_io_deq_bits_MPORT_data = ram_mret_epc[ram_mret_epc_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_mret_epc_MPORT_data = io_enq_bits_mret_epc;
  assign ram_mret_epc_MPORT_addr = 1'h0;
  assign ram_mret_epc_MPORT_mask = 1'h1;
  assign ram_mret_epc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_dnpc_io_deq_bits_MPORT_en = 1'h1;
  assign ram_dnpc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_dnpc_io_deq_bits_MPORT_data = ram_dnpc[ram_dnpc_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_dnpc_MPORT_data = io_enq_bits_dnpc;
  assign ram_dnpc_MPORT_addr = 1'h0;
  assign ram_dnpc_MPORT_mask = 1'h1;
  assign ram_dnpc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_redirect_io_deq_bits_MPORT_en = 1'h1;
  assign ram_redirect_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_redirect_io_deq_bits_MPORT_data = ram_redirect[ram_redirect_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_redirect_MPORT_data = io_enq_bits_redirect;
  assign ram_redirect_MPORT_addr = 1'h0;
  assign ram_redirect_MPORT_mask = 1'h1;
  assign ram_redirect_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 309:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 308:19]
  assign io_deq_bits_aluOut = ram_aluOut_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_pc = ram_pc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_inst_type = ram_inst_type_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_inst_name = ram_inst_name_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_rs1_addr = ram_rs1_addr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_rd_addr = ram_rd_addr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_csr_addr = ram_csr_addr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_csrRdata = ram_csrRdata_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_memValid = ram_memValid_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_memWrite = ram_memWrite_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_memAddr = ram_memAddr_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_memWdata = ram_memWdata_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_memWmask = ram_memWmask_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_ecall_epc = ram_ecall_epc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_mret_epc = ram_mret_epc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_dnpc = ram_dnpc_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_redirect = ram_redirect_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  always @(posedge clock) begin
    if (ram_aluOut_MPORT_en & ram_aluOut_MPORT_mask) begin
      ram_aluOut[ram_aluOut_MPORT_addr] <= ram_aluOut_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_pc_MPORT_en & ram_pc_MPORT_mask) begin
      ram_pc[ram_pc_MPORT_addr] <= ram_pc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_inst_type_MPORT_en & ram_inst_type_MPORT_mask) begin
      ram_inst_type[ram_inst_type_MPORT_addr] <= ram_inst_type_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_inst_name_MPORT_en & ram_inst_name_MPORT_mask) begin
      ram_inst_name[ram_inst_name_MPORT_addr] <= ram_inst_name_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_rs1_addr_MPORT_en & ram_rs1_addr_MPORT_mask) begin
      ram_rs1_addr[ram_rs1_addr_MPORT_addr] <= ram_rs1_addr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_rd_addr_MPORT_en & ram_rd_addr_MPORT_mask) begin
      ram_rd_addr[ram_rd_addr_MPORT_addr] <= ram_rd_addr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_csr_addr_MPORT_en & ram_csr_addr_MPORT_mask) begin
      ram_csr_addr[ram_csr_addr_MPORT_addr] <= ram_csr_addr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_csrRdata_MPORT_en & ram_csrRdata_MPORT_mask) begin
      ram_csrRdata[ram_csrRdata_MPORT_addr] <= ram_csrRdata_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_memValid_MPORT_en & ram_memValid_MPORT_mask) begin
      ram_memValid[ram_memValid_MPORT_addr] <= ram_memValid_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_memWrite_MPORT_en & ram_memWrite_MPORT_mask) begin
      ram_memWrite[ram_memWrite_MPORT_addr] <= ram_memWrite_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_memAddr_MPORT_en & ram_memAddr_MPORT_mask) begin
      ram_memAddr[ram_memAddr_MPORT_addr] <= ram_memAddr_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_memWdata_MPORT_en & ram_memWdata_MPORT_mask) begin
      ram_memWdata[ram_memWdata_MPORT_addr] <= ram_memWdata_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_memWmask_MPORT_en & ram_memWmask_MPORT_mask) begin
      ram_memWmask[ram_memWmask_MPORT_addr] <= ram_memWmask_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_ecall_epc_MPORT_en & ram_ecall_epc_MPORT_mask) begin
      ram_ecall_epc[ram_ecall_epc_MPORT_addr] <= ram_ecall_epc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_mret_epc_MPORT_en & ram_mret_epc_MPORT_mask) begin
      ram_mret_epc[ram_mret_epc_MPORT_addr] <= ram_mret_epc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_dnpc_MPORT_en & ram_dnpc_MPORT_mask) begin
      ram_dnpc[ram_dnpc_MPORT_addr] <= ram_dnpc_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_redirect_MPORT_en & ram_redirect_MPORT_mask) begin
      ram_redirect[ram_redirect_MPORT_addr] <= ram_redirect_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
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
    ram_aluOut[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_pc[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_inst_type[initvar] = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_inst_name[initvar] = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_rs1_addr[initvar] = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_rd_addr[initvar] = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_csr_addr[initvar] = _RAND_6[10:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_csrRdata[initvar] = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_memValid[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_memWrite[initvar] = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_memAddr[initvar] = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_memWdata[initvar] = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_memWmask[initvar] = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ecall_epc[initvar] = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_mret_epc[initvar] = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_dnpc[initvar] = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_redirect[initvar] = _RAND_16[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  maybe_full = _RAND_17[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
