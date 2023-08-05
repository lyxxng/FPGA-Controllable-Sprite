// Sprite movement
module move_four_sprite #(parameter ADD = 64, parameter X_MAX = 640, parameter Y_MAX = 480)
    (input logic clk, input logic reset, input logic enable, input logic up_right_n, input logic down_left_n,
    output logic [9:0] x_coord, output logic [9:0] y_coord, output logic [1:0] direction);
    
    // 00: Up, 01: Down, 10: Left, 11: Right for mux
    always_ff@(posedge clk, posedge reset) begin
   	    if (reset) begin
   		    x_coord   <= 1; // Get rid of line at left edge
   		    y_coord   <= 0;
   		    direction <= 2'b01;
   	    // Vertical movement
   	    end else if (enable) begin
   		    if (!up_right_n && (y_coord > 0)) begin
   			    y_coord <= y_coord - 1; // Move up
   			    direction <= 2'b00;
   		    end else if (!down_left_n & (y_coord + ADD < Y_MAX)) begin
   			    y_coord   <= y_coord + 1; // Move down
   			    direction <= 2'b01;
   		    end
   	    // Horizontal movement
   	    end else begin
   		    if (!up_right_n && (x_coord + ADD < X_MAX)) begin
   			    x_coord   <= x_coord + 1; // Move right
   			    direction <= 2'b11;
   		    end else if (!down_left_n & (x_coord > 1)) begin
   			    x_coord   <= x_coord - 1; // Move left
   			    direction <= 2'b10;
   		    end
   	    end
    end
endmodule