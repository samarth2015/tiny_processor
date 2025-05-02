`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 01:16:10 AM
// Design Name: 
// Module Name: register_bank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_bank(
    read_add, write_add, en, data, rst, op
    );
    
    input [3:0] read_add, write_add;
    input [15:0]en;
    input rst;
    input [7:0] data;
    output [7:0] op;
    wire [7:0] Q [15:0];
    
    assign op = Q[read_add];
    
    genvar i;
    generate
        for(i = 0; i < 16; i = i+1)
        begin:bank_reg
            register rg(data, en[i], rst, i, Q[i]);
        end
    endgenerate
    

endmodule
