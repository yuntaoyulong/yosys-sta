module key2ascii(
    input clk,
    input wire [7:0] kbd_data,
    output reg [7:0] ascii
);
    always @(*) begin
        case(kbd_data)
                8'h45: ascii = 8'h30;   // 0
                8'h16: ascii = 8'h31;   // 1
                8'h1e: ascii = 8'h32;   // 2
                8'h26: ascii = 8'h33;   // 3
                8'h25: ascii = 8'h34;   // 4
                8'h2e: ascii = 8'h35;   // 5
                8'h36: ascii = 8'h36;   // 6
                8'h3d: ascii = 8'h37;   // 7
                8'h3e: ascii = 8'h38;   // 8
                8'h46: ascii = 8'h39;   // 9
                8'h1c: ascii = 8'h61;   // a
                8'h32: ascii = 8'h62;   // b
                8'h21: ascii = 8'h63;   // c
                8'h23: ascii = 8'h64;   // d
                8'h24: ascii = 8'h65;   // e
                8'h2b: ascii = 8'h66;   // f
                8'h34: ascii = 8'h67;   // g
                8'h33: ascii = 8'h68;   // h
                8'h43: ascii = 8'h69;   // i
                8'h3b: ascii = 8'h6A;   // j
                8'h42: ascii = 8'h6B;   // k
                8'h4b: ascii = 8'h6C;   // l
                8'h3a: ascii = 8'h6D;   // m
                8'h31: ascii = 8'h6E;   // n
                8'h44: ascii = 8'h6F;   // o
                8'h4d: ascii = 8'h70;   // p
                8'h15: ascii = 8'h71;   // q
                8'h2d: ascii = 8'h72;   // r
                8'h1b: ascii = 8'h73;   // s
                8'h2c: ascii = 8'h74;   // t
                8'h3c: ascii = 8'h75;   // u
                8'h2a: ascii = 8'h76;   // v
                8'h1d: ascii = 8'h77;   // w
                8'h22: ascii = 8'h78;   // x
                8'h35: ascii = 8'h79;   // y
                8'h1a: ascii = 8'h7A;   // z
                8'h0e: ascii = 8'h60;   // `
                8'h4e: ascii = 8'h2D;   // -
                8'h55: ascii = 8'h3D;   // =
                8'h54: ascii = 8'h5B;   // [
                8'h5b: ascii = 8'h5D;   // ]
                8'h5d: ascii = 8'h5C;   // \
                8'h4c: ascii = 8'h3B;   // ;
                8'h52: ascii = 8'h27;   // '
                8'h41: ascii = 8'h2C;   // ,
                8'h49: ascii = 8'h2E;   // .
                8'h4a: ascii = 8'h2F;   // /
                8'h29: ascii = 8'h20;   // space
                8'h5a: ascii = 8'h0D;   // enter
                8'h66: ascii = 8'h08;   // backspace
                8'h0D: ascii = 8'h09;   // horizontal tab	
                
                default: ascii = 8'h2A; // *
        endcase
    end
endmodule