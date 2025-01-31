`timescale 1ns / 1ps

`timescale 1ns / 1ps

module instruct_mem_2(read_addr, instruct);

    input [31:0] read_addr;
    output reg [31:0] instruct;

    reg [31:0] imem [0:127];

    initial begin
        $readmemh("C:/Users/RAVI/mips4/mips4.srcs/sources_1/new/memfile.txt", imem);  // Read instructions from memfile.txt in hex format
    end

    always @(*) begin
        instruct = imem[read_addr[31:2]];
    end

endmodule
