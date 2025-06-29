module ALU(
  input [3:0] A,
  input [3:0] B,
  input [2:0] ALUOP,
  output reg [3:0] Y,
  output reg zero,
  output reg carry,
  output reg overflow
);

reg [3:0] br;

always @(*) begin
  Y = 4'b0000;
  zero = 0;
  carry = 0;
  overflow = 0;
  br = B;
  if (ALUOP == 3'b000) begin // ADD
    {carry,Y} = A + B;
    overflow = (A[3]==B[3]&&Y[3]!=A[3]);
  end
  else if (ALUOP == 3'b001) begin // SUB
    br = ~B+1;
    {carry,Y} = A + br;
    carry = ~carry;
    overflow = (A[3]!=B[3]&&Y[3]!=A[3]);
  end
  else if (ALUOP == 3'b010) begin // NOT
    Y = ~A;
  end
  else if (ALUOP == 3'b011) begin // AND
    Y = A & B;
  end
  else if (ALUOP == 3'b100) begin // OR
    Y = A | B;
  end
  else if (ALUOP == 3'b101) begin // XOR
    Y = A ^ B;
  end 
  else if (ALUOP == 3'b110) begin // SLT  
    if (A[3] != B[3]) begin  
        Y = A[3] ? 4'b0001 : 4'b0000;  
    end else begin  
        Y = A < B ? 4'b0001 : 4'b0000;  
    end  
  end  
  else if (ALUOP == 3'b111) begin
      Y = A == B ? 4'b0001 : 4'b0000;
  end
  if (Y == 4'b0000) zero = 1;
  else zero = 0;

  end
  

endmodule 