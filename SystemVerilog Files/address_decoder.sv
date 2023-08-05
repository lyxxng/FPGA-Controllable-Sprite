// Get address for displayed pixel
module address_decoder #(parameter ROWVALUE = 64)
    (input logic [9:0] column, input logic [9:0] row, input logic [9:0] x_coord, input logic [9:0] y_coord, output logic [11:0] adr);

    // Add one to column to handle offset
    assign adr = ((row - y_coord) * ROWVALUE) + (column + 1 - x_coord);
endmodule