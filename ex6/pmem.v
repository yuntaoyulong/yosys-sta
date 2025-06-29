
// import "DPI-C" function int pmem_read(input int raddr);
// import "DPI-C" function void pmem_write(
//   input int waddr, input int wdata, input byte wmask);


// module Imem(
//     input          valid,   // valid signal
//     input   [31:0] raddr,  // read address
//     output reg [31:0] rdata   // read data
// );
//     always @(*) begin
//     if (valid) begin // 有读写请求时
//         rdata = pmem_read(raddr);
//     end
//     else begin
//         rdata = 0;
//     end
//     end
// endmodule

// module Dmem(
//     // input  clk, // 时钟信号
//     input          req_wen,    // write enable
//     input   [31:0] req_waddr,  // write address
//     input   [31:0] req_wdata,  // write data
//     input   [7:0]  req_wmask,  // write mask
//     input          req_valid,   // valid signal
//     input   [31:0] req_raddr,  // read address
//     output reg [31:0] rdata   // read data

// );

//     always @(* ) begin
//     if (req_valid) begin // 有读写请求时
//         rdata = pmem_read(req_raddr);
//         if (req_wen) begin // 有写请求时
//         pmem_write(req_waddr, req_wdata, req_wmask);
//         end
//     end
//     else begin
//         rdata = 0;
//     end
//     end
// endmodule