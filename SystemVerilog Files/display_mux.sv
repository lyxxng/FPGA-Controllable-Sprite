// Determine if background or sprite should be displayed
module display_mux(input logic [15:0] sprite, input logic [11:0] bg, input logic display, output logic [11:0] y);
    logic [11:0] rgb;
    logic [3:0] alpha;
    
    always_comb begin
   	    rgb = {sprite[15:4]};  // Store rgb information from ROM
   	    alpha = {sprite[3:0]}; // Store alpha information
    end
    
    always_comb begin
   	    // Background if transparent or not in display
   	    if (display & alpha == 0)      y <= bg;
   	    else if (display & alpha != 0) y <= rgb;
   	    else y <= bg;
    end
   	 
endmodule