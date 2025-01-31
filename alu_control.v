`timescale 1ns / 1ps

module alu_control(
    aluop, funct, alucontrol_signal
    );
input [1:0]aluop;
input [5:0]funct;
output reg [2:0]alucontrol_signal;

always @(*) begin
if (aluop==2'b00) alucontrol_signal=3'b010;
else if (aluop==2'b01) alucontrol_signal=3'b110;

else begin
    case(funct)
        6'b100000 : alucontrol_signal = 3'b010;       // add
        6'b100010 : alucontrol_signal = 3'b110;       // sub
        6'b100100 : alucontrol_signal = 3'b000;       // AND
        6'b100101 : alucontrol_signal = 3'b001;       // OR
        6'b101010 : alucontrol_signal = 3'b111;       // slt
    endcase
    end
end
endmodule
