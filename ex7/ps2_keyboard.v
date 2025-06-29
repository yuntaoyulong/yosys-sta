module ps2_keyboard(clk,clrn,ps2_clk,ps2_data,data,  
                ready,nextdata_n,overflow);  
    input clk,clrn,ps2_clk,ps2_data;  
    input nextdata_n;  
    output [7:0] data;  
    output reg ready;  
    output reg overflow;     // fifo overflow  
    // internal signal, for test  
    reg [9:0] buffer;        // ps2_data bits  
    reg [7:0] fifo[7:0];     // data fifo  
    reg [2:0] w_ptr,r_ptr;   // fifo write and read pointers  
    reg [3:0] count;  // count ps2_data bits  
    // detect falling edge of ps2_clk  
    reg [2:0] ps2_clk_sync;  

    // 添加调试计数器  
    integer debug_counter = 0;  

    always @(posedge clk) begin  
        ps2_clk_sync <=  {ps2_clk_sync[1:0],ps2_clk};  
    end  

    wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];  

    // 检测PS/2时钟下降沿  
    always @(posedge clk) begin  
        if (sampling) begin  
            $display("[PS2 DBG %0d] Detected PS2 clock falling edge", debug_counter);  
            debug_counter = debug_counter + 1;  
        end  
    end  

    always @(posedge clk) begin  
        if (clrn == 0) begin // reset  
            count <= 0; w_ptr <= 0; r_ptr <= 0; overflow <= 0; ready<= 0;  
            $display("[PS2 RESET] Module reset");  
        end  
        else begin  
            $display("[PS2 RESET] Module set%b%b",ps2_clk_sync[2:0],ps2_clk); 
            if (ready) begin // read to output next data  
                if(nextdata_n == 1'b0) begin //read next data  
                    r_ptr <= r_ptr + 3'b1;  
                    $display("[PS2 FIFO] Data read from FIFO: %h, r_ptr: %d -> %d",   
                             fifo[r_ptr], r_ptr, r_ptr+1);  
                    if(w_ptr==(r_ptr+1'b1)) begin //empty  
                        ready <= 1'b0;  
                        $display("[PS2 FIFO] FIFO now empty, ready deasserted");  
                    end  
                end  
            end  
            if (sampling) begin  
              if (count == 4'd10) begin  
                $display("[PS2 FRAME] Complete frame received: %b", buffer);  
                $display("[PS2 FRAME] Start bit: %b, Data: %b, Parity: %b, Stop bit: %b",  
                         buffer[0], buffer[8:1], buffer[9], ps2_data);  
                
                if ((buffer[0] == 0) &&  // start bit  
                    (ps2_data)       &&  // stop bit  
                    (^buffer[9:1])) begin      // odd parity  
                    fifo[w_ptr] <= buffer[8:1];  // kbd scan code  
                    $display("[PS2 DATA] Valid data received: %h, writing to FIFO[%d]",   
                             buffer[8:1], w_ptr);  
                    w_ptr <= w_ptr+3'b1;  
                    ready <= 1'b1;  
                    
                    if (r_ptr == (w_ptr + 3'b1)) begin  
                        $display("[PS2 ERROR] FIFO overflow occurred!");  
                        overflow <= 1;  
                    end  
                end else begin  
                    $display("[PS2 ERROR] Frame error! start:%b stop:%b parity_check:%b",   
                             buffer[0], ps2_data, (^buffer[9:1]));  
                end  
                count <= 0;     // for next  
              end else begin  
                buffer[count] <= ps2_data;  // store ps2_data  
                $display("[PS2 BIT] Received bit %d: %b", count, ps2_data);  
                count <= count + 3'b1;  
              end  
            end  
        end  
    end  
    
    // 监控输出数据变化  
    always @(data) begin  
        $display("[PS2 OUTPUT] Current output data: %h", data);  
    end  
    
    // 监控ready信号变化  
    always @(ready) begin  
        $display("[PS2 STATE] Ready signal changed to: %b", ready);  
    end  
    
    assign data = fifo[r_ptr]; //always set output data  

endmodule  