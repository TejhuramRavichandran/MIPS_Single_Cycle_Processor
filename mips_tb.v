`timescale 1ns / 1ps

module mipsTb;

    reg clk;
    reg rst;
    wire memread,memwrite,regwrite,memtoreg;
    wire [31:0] pc_out,instruct,read_data_1,read_data_2,write_data,aluout;
    wire [4:0]write_reg;
    wire [31:0] read_data;
    
    mips uut(
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
    write_data
    );

    always #5 clk = ~clk;

    initial begin
      clk=0; rst=1;
		  #4  rst=0;
		  #100 $finish;               
    end

endmodule
