`timescale 1ns / 1ps

module shift_left_26bit (shift_in, shift_out);

    input [25:0] shift_in;
    output reg [27:0] shift_out;

    always @(*) begin
        shift_out = {shift_in, 2'b00};
    end

endmodule

module shift_left_32bit (shift_in, shift_out);

    input [31:0] shift_in;
    output reg [31:0] shift_out;

    always @(*) begin
        shift_out = shift_in << 2;
    end

endmodule