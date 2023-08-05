// Slow clock for sprite movement
module slow_clock(input logic clk, input logic reset, output logic [17:0] q);
    always_ff@(posedge clk, posedge reset) begin
   	 if (reset) q <= 0;
   	 else       q <= q + 1;
    end
endmodule