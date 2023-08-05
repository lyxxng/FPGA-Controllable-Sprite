// Create 25 MHz clock signal for VGA driver
module divide_clock(input logic clk, input logic reset, output logic q);
    
    always_ff@(posedge clk, posedge reset)
   	 if (reset) q <= 0;
   	 else       q <= q + 1;
endmodule