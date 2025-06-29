module keyboard (
  input clk,
  input rst,
  input kbd_clk,kbd_data,
  output [6:0] seg0,seg1,seg2,seg3,seg6,seg7
);
wire nextdata_n=1'b0;
wire [7:0] data;
wire ready,overflow;


ps2_keyboard inst(
    .clk(clk),
    .clrn(~rst),
    .ps2_clk(kbd_clk),
    .ps2_data(kbd_data),
    .data(data),
    .ready(ready),
    .nextdata_n(nextdata_n),
    .overflow(overflow)
);


reg [7:0] ascii;
reg [7:0] curdata;
reg onhold_en;
reg [7:0] cnt;
reg [1:0] button;

key2ascii inst1(
    .clk(clk),
    .kbd_data(curdata),
    .ascii(ascii)
);

bcd7seg bcd7seg0(.en(onhold_en), .b(curdata[3:0]), .h(seg0));
bcd7seg bcd7seg1(.en(onhold_en), .b(curdata[7:4]), .h(seg1));

bcd7seg bcd7seg2(.en(onhold_en), .b(ascii[3:0]), .h(seg2));
bcd7seg bcd7seg3(.en(onhold_en), .b(ascii[7:4]), .h(seg3));

bcd7seg bcd7seg6(.en(1), .b(cnt[3:0]), .h(seg6));
bcd7seg bcd7seg7(.en(1), .b(cnt[7:4]), .h(seg7));

always @(posedge clk) begin
  $display("kbd_clk%b",kbd_clk);
  if (rst == 0 &&ready) begin
    $display("receive");
    if (button == 2'b00) begin
      $display("receive %x", data[7:0]);
      onhold_en <= 1'b1;
      cnt <= cnt + 8'b1;
      curdata <= data;
      button  <= 2'b01;
    end else if (button  == 2'b01) begin
      if (data == 8'hf0) begin
        button  <= 2'b10;
        onhold_en <= 1'b0;
      end
    end else if (button  == 2'b10) begin
      button <= 2'b00;
    end
  end
end


initial begin 
  onhold_en = 1'b0;
  cnt = 0;
  button  = 0;
end

endmodule
