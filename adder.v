`timescale 1ns / 1ps


module adder(
    i1, i2, adder_out
    );
input [31:0]i1,i2;
output reg [31:0]adder_out;

always @(*) begin
adder_out = i1 + i2;
end
endmodule
