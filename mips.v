`timescale 1ns / 1ps


module mips(
    clk,rst,
    branch,
    jump,
    pc_out,
    instruct,
    memread,memwrite,
    read_data_1,
    read_data_2,
    read_data,
    aluout,
    memtoreg,
    regwrite,
    write_reg,
    write_data,
    
    );
    
input clk,rst;
output memread,memwrite,regwrite,memtoreg,branch,jump;
output [31:0] pc_out,instruct,read_data_1,read_data_2,write_data,aluout;
output [4:0]write_reg;
output [31:0] read_data;

//PC Module
wire [31:0] pc_in, pc_temp;
pc_adder pc_alu_adder(pc_out,pc_temp);
program_counter pc(clk,rst,pc_in,pc_out);

//Instruction Memory
instruct_mem instruction_memory(pc_out, instruct);

//Control Unit
wire [5:0]opcode;
assign opcode=instruct[31:26];
wire regdst,
    alusrc;
wire [1:0]aluop;
control_unit controller(
    opcode,regdst,branch,memread,memtoreg,aluop,memwrite,
    alusrc,regwrite,jump);
    
//Register File
regfile register_file(clk,regwrite,
    instruct[25:21],instruct[20:16],write_reg,
    write_data,
    read_data_1, read_data_2);

//WriteReg Mux
mux #5 mux_write_reg(instruct[20:16],instruct[15:11],regdst,write_reg);

//Sign extension
wire [31:0]sign_ext_out;
sign_extend sgnext(instruct[15:0],sign_ext_out);

//ALU Control
wire [2:0]alucontrol_signal;
alu_control alucontroller(aluop,instruct[5:0],alucontrol_signal); 

//ALU Mux
wire [31:0]alu_src_b;
mux #32 mux_alu(read_data_2,sign_ext_out,alusrc,alu_src_b);

//ALU
wire aluzero;
alu alu_block(read_data_1,alu_src_b,alucontrol_signal,aluout,aluzero);

//Data Memory
data_memory dmem(clk,aluout[6:0],read_data_2,memread,memwrite,read_data);

//Data Memory Mux
wire [31:0]write_data;
mux #32 mux_datamem(read_data,aluout,memtoreg,write_data);

//Jump shift module
wire [27:0] jump_temp;
wire [31:0] jump_address;
shift_left_26bit SL1(instruct[25:0], jump_temp);
assign jump_address={pc_temp[31:28],jump_temp};

//Branch vs PC shift module
wire [31:0] branch_pc_temp;
shift_left_32bit SL2(sign_ext_out,branch_pc_temp);

//Adder module
wire [31:0] adder_out;
adder adder_module(pc_temp,branch_pc_temp,adder_out);

//Adder Mux
wire adder_mux_select_signal;
assign adder_mux_select_signal = branch & aluzero;
wire [31:0] adder_mux_out;
mux #(32) adder_mux(pc_temp,adder_mux_out,adder_mux_select_signal,adder_mux_out);

//Mux for jump
mux #(32) jump_mux(adder_mux_out, jump_address, jump, pc_in);

endmodule
