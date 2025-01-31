`timescale 1ns / 1ps

module mux #(parameter M=5)(
    in0,in1,sel,out
    );
input [M-1:0]in0,in1;
input sel;
output reg [M-1:0]out;

always @(*)begin
if (sel) out=in1;
else out=in0;
end
endmodule
