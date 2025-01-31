`timescale 1ns / 1ps


module control_unit(
    opcode,regdst,branch,memread,memtoreg,aluop,memwrite,
    alusrc,regwrite,jump
    );
input [5:0]opcode;
output reg regdst,branch,memread,memtoreg,memwrite,
    alusrc,regwrite,jump
    ;
output reg [1:0]aluop;

always @(*) begin
case(opcode)
    6'b000000: begin
        regdst=1;
        branch=0;
        memread=0;
        memtoreg=1;
        memwrite=0;
        alusrc=0;
        regwrite=1;
        jump=0;
        aluop=2'b10;
    end

    6'b001000: begin
        regdst=0;
        branch=0;
        memread=0;
        memtoreg=1;
        memwrite=0;
        alusrc=1;
        regwrite=1;
        jump=0;
        aluop=2'b00;
    end
    
    6'b100011: begin
        regdst=0;
        branch=0;
        memread=1;
        memtoreg=0;
        memwrite=0;
        alusrc=1;
        regwrite=1;
        jump=0;
        aluop=2'b00;
    end
    
    6'b101011: begin
        regdst=0;
        branch=0;
        memread=0;
        memtoreg=0;
        memwrite=1;
        alusrc=1;
        regwrite=0;
        jump=0;
        aluop=2'b00;
    end
    
    6'b000100: begin
        regdst=0;
        branch=1;
        memread=0;
        memtoreg=0;
        memwrite=0;
        alusrc=0;
        regwrite=0;
        jump=0;
        aluop=2'b01;
    end
    
    6'b000010: begin
        regdst=0;
        branch=1;
        memread=0;
        memtoreg=0;
        memwrite=0;
        alusrc=0;
        regwrite=0;
        jump=1;
        aluop=2'b01;
    end
    
endcase
end
endmodule
