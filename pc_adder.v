`timescale 1ns / 1ps


module pc_adder(
    pc_adder_in, pc_adder_out
    );
input [31:0]pc_adder_in;
output reg [31:0]pc_adder_out;

always @(*) begin
pc_adder_out=pc_adder_in+4;
end
endmodule
