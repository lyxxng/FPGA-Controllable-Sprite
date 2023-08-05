// Decode rgb input from FPGA switches
module rgb_decoder(input logic [1:0] rgb_control, output logic [3:0] rgb_display);
    always_comb
   	    case(rgb_control)
   		    0: rgb_display = 4'b0000;
   		    1: rgb_display = 4'b0101;
   		    2: rgb_display = 4'b1010;
   		    3: rgb_display = 4'b1111;
   	    endcase
endmodule