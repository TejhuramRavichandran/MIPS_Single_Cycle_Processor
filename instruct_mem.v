`timescale 1ns / 1ps


module instruct_mem(read_addr, instruct);

    input [31:0] read_addr;
    output reg [31:0] instruct;

    reg [31:0] imem [0:127];

    integer i = 0;


    initial begin
        for(i = 0; i < 128; i = i + 1) begin    // Make all memory locations 0
            imem[i] = 0;
        end
        
        /*  Basic Arithmetic and Control Flow Instructions */
        imem[1]  = {6'd8, 5'd0, 5'd2, 16'd5};   // addi $2, $0, 5
        imem[2]  = {6'd8, 5'd0, 5'd7, 16'd3};   // addi $7, $0, 3
        imem[3]  = {6'd8, 5'd0, 5'd3, 16'd12};   // addi $3, $0, 12
        imem[4]  = {6'd0, 5'd7, 5'd2, 5'd4, 5'd0, 6'd37};   // or $4, $7, $2
        imem[5]  = {6'd0, 5'd3, 5'd4, 5'd5, 5'd0, 6'd36};   // and $5, $3, $4
        imem[6]  = {6'd0, 5'd5, 5'd5, 5'd5, 5'd0, 6'd32};   // add $5, $5, $4
        imem[7]  = {6'd4, 5'd5, 5'd7, 16'd8};   // beq $5, $7, end
        imem[8]  = {6'd0, 5'd3, 5'd4, 5'd6, 5'd0, 6'd42};   // slt $6, $3, $4
        imem[9]  = {6'd4, 5'd6, 5'd0, 16'd1};   // beq $6, $0, around
        imem[10] = {6'd8, 5'd0, 5'd5, 16'd10};   // addi $5, $0, 10
        imem[11] = {6'd0, 5'd7, 5'd2, 5'd6, 5'd0, 6'd42};   // slt $6, $7, $2
        imem[12] = {6'd0, 5'd6, 5'd5, 5'd7, 5'd0, 6'd32};   // add $7, $6, $5
        imem[13] = {6'd0, 5'd7, 5'd2, 5'd7, 5'd0, 6'd34};   // sub $7, $7, $2
        imem[14] = {6'd2, 26'd15};   // j end
        imem[15] = {6'd35, 5'd0, 5'd7, 16'd0};   // lw $7, 0($0)
        imem[16] = {6'd43, 5'd2, 5'd7, 16'd71};   // sw $7, 71($2)  
             

/*              Instructions for basic Register arithmetic      
        imem[1] = {6'd8, 5'd0, 5'd8, 16'd29};                 // addi $t0, $zero, 29
        imem[2] = {6'd8, 5'd0, 5'd9, 16'd31};                 // addi $t1, $zero, 31
        imem[3] = {6'd0, 5'd9, 5'd8, 5'd11, 5'd0, 6'd32};         // add $t3, $t1, $t0
        imem[4] = {6'd0, 5'd11, 5'd9, 5'd12, 5'd0, 6'd34};        // sub $t4, $t3, $t1
         */
        

        /*    Instructions for lw and sw demonstration      
        imem[1] = {6'd8, 5'd0, 5'd8, 16'd29};                 // addi $t0, $zero, 29
        imem[2] = {6'd8, 5'd0, 5'd9, 16'd20};                 // addi $t1, $zero, 20
        imem[3] = {6'd43, 5'd9, 5'd8, 16'd4};                    // sw $t0, 4($t1)
        imem[4] = {6'd35, 5'd9, 5'd10, 16'd4};                     // lw $t2, 4($t1)       
        

        /*    Instructions for beq demonstration    
        imem[1] = {6'd8, 5'd0, 5'd8, 16'd12};                 // addi $t0, $zero, 12
        imem[2] = {6'd8, 5'd0, 5'd9, 16'd5};                 // addi $t1, $zero, 5
        imem[3] = {6'd8, 5'd0, 5'd10, 16'd7};                 // addi $t2, $zero, 7
        imem[4] = {6'd0, 5'd8, 5'd9, 5'd11, 5'd0, 6'd32};     // add $t3, $t0, $t1
        imem[5] = {6'd4, 5'd11, 5'd8, 16'd3};                 // beq $t3, $t0, +3
        imem[6] = {6'd0, 5'd9, 5'd10, 5'd11, 5'd0, 6'd32};     // add $t3, $t1, $t2
        imem[7] = {6'd4, 5'd11, 5'd8, 16'd1};                  // beq $t3, $t0, +1
        imem[8] = {6'd0, 5'd8, 5'd11, 5'd8, 5'd0, 6'd34};     // sub $t0, $t3, $t0
        imem[9] = {6'd0, 5'd9, 5'd8, 5'd12, 5'd0, 6'd32};     // add $t4, $t1, $t0
        */

        /*      Instructions for jump demonstration           
        imem[1] = {6'd8, 5'd0, 5'd8, 16'd12};                      // addi $t0, $zero, 12
        imem[2] = {6'd8, 5'd0, 5'd9, 16'd5};                      // addi $t1, $zero, 5
        imem[3] = {6'd0, 5'd9, 5'd8, 5'd10, 5'd0, 6'd32};         //  add $t2, $t1, $t0
        imem[4] = {6'd2, 26'd50};                                  //  j 50
        imem[5] = {6'd0, 5'd11, 5'd10, 5'd12, 5'd0, 6'd34};        // sub $t4, $t3, $t2     
        imem[6] = {6'd0, 5'd9, 5'd8, 5'd12, 5'd0, 6'd32};          // add $t4, $t1, $t0
        imem[50] = {6'd0, 5'd8, 5'd10, 5'd11, 5'd0, 6'd32};        // add $t3, $t0, $t2
        */
        
        

    end

    always @(*) begin
      instruct = imem[read_addr[31:2]];
    end

endmodule
