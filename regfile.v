`timescale 1ns / 1ps


module regfile(
    clk,regwrite,
    read_reg_1,read_reg_2,write_reg,
    write_data,
    read_data_1, read_data_2
    );
input clk,regwrite;
input [4:0]read_reg_1,read_reg_2,write_reg;
input [31:0]write_data;
output reg [31:0]read_data_1,read_data_2;

reg [31:0]register_set[0:31];

integer i=0;

initial begin
    for (i=0; i<32; i=i+1) begin
        register_set[i]= 32'b0;
    end
end

always @(read_reg_1 or register_set[read_reg_1]) begin
if (read_reg_1!=0) read_data_1=register_set[read_reg_1];
else read_data_1=0;
end 

always @(read_reg_2 or register_set[read_reg_2]) begin
if (read_reg_2!=0) read_data_2=register_set[read_reg_2];
else read_data_2=0;
end

always @(posedge clk) begin
if (regwrite) register_set[write_reg]<=write_data;
end


endmodule
