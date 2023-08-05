// Determine if count is in display coordinates
module compare_display #(parameter N = 64)
    (input logic [9:0] count, input logic [9:0] coord, output logic screen);
    
    assign screen = ((count < coord + N) & (count >= coord)) ? 1 : 0;
endmodule