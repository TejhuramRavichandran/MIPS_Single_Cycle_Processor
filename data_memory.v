`timescale 1ns / 1ps

module data_memory (clk, address, write_data, mem_read, mem_write, 
            read_data);

    input clk, mem_read, mem_write;
    input [6:0] address;                        // 7 bit address for addressing 128 locations
    input [31:0] write_data;
    output [31:0] read_data;

    reg [31:0] data_mem [0:127];               // 128 memory locations of 32 bits each

    integer i = 0;
    
    initial begin                                   // Initialization of memory
        for(i = 0; i < 128; i = i + 1) begin
            data_mem[i] = 0;
        end
    end

    assign read_data = data_mem[address];

    always @(posedge clk) begin                     // For writing data 
      if (mem_write)
        data_mem[address] = write_data;
    end

endmodule
