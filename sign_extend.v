`timescale 1ns / 1ps


module sign_extend(sign_extend_in, sign_extend_out);

input [15:0] sign_extend_in;
output reg [31:0] sign_extend_out;

always @(*) begin
    sign_extend_out = {{16{sign_extend_in[15]}}, sign_extend_in};
end

endmodule
