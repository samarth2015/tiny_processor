`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:40:28 PM
// Design Name: 
// Module Name: instructions
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


module instructions(
    pc, op
    );
    
    input [4:0] pc;
    output [7:0] op;
    reg [7:0] instructions_set [31:0];
    
//    assign x = instructions_set[pc][7:4];
//    assign y = instructions_set[pc][3:0];
    assign op = instructions_set[pc];
    initial begin
    instructions_set[0]=8'b10010001; 
    instructions_set[1]=8'b01100001;
    instructions_set[2]=8'b00010101;
    instructions_set[3]=8'b00010110;
    instructions_set[4]=8'b10100111;
    instructions_set[5]=8'b11111111;

        
    end
    
    
endmodule

