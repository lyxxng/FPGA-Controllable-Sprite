// Create sync and display timings for VGA driver
module timing_generator(input logic clk, input logic reset, output logic h_display, output logic v_display, output logic h_sync, output logic v_sync, output logic [9:0] h_count, output logic [9:0] v_count);
    
     // Horizontal timings
	parameter HA_END = 639;       	// End of active pixels
	parameter HS_STA = HA_END + 16; // Sync starts
	parameter HS_END = HS_STA + 96; // Sync ends
	parameter LINE   = 799;       	// Last pixel

	// Vertical timings
	parameter VA_END = 479;       	// End of active pixels
	parameter VS_STA = VA_END + 10; // Sync starts
	parameter VS_END = VS_STA + 2;	// Sync ends
	parameter SCREEN = 524;       	// Last pixel
    
    
    always_ff@(posedge clk, posedge reset) begin
   	 	// Reset both counters to 0
   	 	if (reset) begin
   		 	h_count <= 0;
   		 	v_count <= 0;
   	 	end else if (h_count > LINE) begin
   			// Reset horizontal count back to 0 at 800
   			h_count <= 0;
   			// Reset veritcal count if at last pixel, otherwise increment
   			if (v_count > SCREEN) v_count <= 0;
   		 	else v_count <= v_count + 1;
   		end
   	 	else
   		 	// Increment horizontal count if not at last pixel
   		 	h_count <= h_count + 1;
    end
    
    // h_sync and v_sync are low at sync, displays are high during active pixels
    assign h_sync = (h_count >= HS_STA & h_count < HS_END) ? 0 : 1;
    assign v_sync = (v_count >= VS_STA & v_count < VS_END) ? 0 : 1;
    assign h_display = (h_count <= HA_END) ? 1 : 0;
    assign v_display = (v_count <= VA_END) ? 1 : 0;
    
endmodule