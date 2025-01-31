`timescale 1ns / 1ps


module alu(
    inp_1, inp_2, alucontrol_signal, aluout, aluzero
    );
input [31:0]inp_1, inp_2;
input [2:0]alucontrol_signal;
output reg aluzero;
output reg [31:0]aluout;

always @(*) begin
case(alucontrol_signal)
    3'b010: aluout = inp_1 + inp_2;
    3'b110: aluout = inp_1 - inp_2;
    3'b000: aluout = inp_1 & inp_2;
    3'b001: aluout = inp_1 | inp_2;
    3'b111: aluout = (inp_1 < inp_2)?(32'd1):(32'd0);
    endcase

if (aluout==0) aluzero=1;
else aluzero=0;
end
endmodule
