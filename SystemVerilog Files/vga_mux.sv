// mux for VGA driver rgb outputs
module vga_mux(input logic display, input logic [3:0] data, output logic [3:0] out);
    // If in display output the data, otherwise output all 0's
    assign out = (display) ? data : 4'b0000;
endmodule