module encode83(  
  input        clk,      // 新增时钟输入  
  input        rst_n,    // 新增异步复位  
  input  [7:0] x,  
  input        en,  
  output [6:0] HEX0,  
  output [2:0] y,        // 改为直接输出寄存器值  
  output       z  
);  
  // 内部寄存器  
  reg [2:0] y_reg;  
  reg       z_reg;  
  
  // 实例化显示模块（保持组合逻辑）  
  bcd7seg seg0(y_reg, HEX0);   
  integer i;  
  // 组合逻辑编码部分  
  always @(*) begin  
    if (en) begin  
      y_reg = 3'b0;  
      z_reg = 1'b0;  
      for( i = 0; i <= 7; i = i+1)  
        if(x[i]) begin   
          y_reg = i[2:0];  
          z_reg = 1'b1;  
        end  
    end else begin  
      y_reg = 3'b0;  
      z_reg = 1'b0;  
    end  
  end  

  // 时序逻辑同步输出  
  always @(posedge clk or negedge rst_n) begin  
    if (!rst_n) begin      // 异步复位  
      y <= 3'b0;  
      z <= 1'b0;  
    end else begin  
      y <= y_reg;         // 寄存器输出  
      z <= z_reg;  
    end  
  end  
endmodule  

module bcd7seg(  
  input  [2:0] b,  
  output reg [6:0] h
);  
  always @(*) begin  
    casez(b)  
      // 数字0-7 
      3'b000: h = 7'b0000001;  
      3'b001: h = 7'b1001111;  
      3'b010: h = 7'b0010010;  
      3'b011: h = 7'b0000110;  
      3'b100: h = 7'b1001100; 
      3'b101: h = 7'b0100100; 
      3'b110: h = 7'b0100000;  
      3'b111: h = 7'b0001111;  
      default: h = 7'b0000000; // 全灭  
    endcase  
  end  
endmodule  

