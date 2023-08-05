// Determine which sprite to display
module rom_mux(input logic [15:0] front, back, left, right, input logic [1:0] direction, output logic [15:0] data);
    always_comb
   	    case(direction)
   		    0: data <= back;  // Upwards movement
   		    1: data <= front; // Downwards movement
   		    2: data <= left;
   		    3: data <= right;
   	    endcase
endmodule