module mux41(  
  input        clk,  
  input        rst_n,  
  input  [7:0] X,  
  input  [1:0] Y,  
  output reg [1:0] F  
);  

  wire [1:0] f_comb;  // Connect mux output here  
  MuxKeyWithDefault #(4, 2, 2) i0 (  
    .out(f_comb),     // Changed from F to f_comb  
    .key(Y),  
    .default_out(2'b00),  
    .lut({  
      2'b00, X[1:0],  
      2'b01, X[3:2],  
      2'b10, X[5:4],  
      2'b11, X[7:6]  
    })  
  );  

  always @(posedge clk or negedge rst_n) begin  
    if (!rst_n) begin  
      F <= 2'b00;  
    end else begin  
      F <= f_comb;    // Register the mux output  
    end  
  end  
endmodule  
