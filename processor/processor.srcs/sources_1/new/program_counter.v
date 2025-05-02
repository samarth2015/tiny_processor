`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 10:47:21 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    rst, clk, en_pc, en_uni, op
    );

    input rst, clk, en_uni;
    input en_pc;
    output reg [4:0] op;

    always @(posedge clk)
    begin
        if (!rst)
            op = 5'b00000;
        else
            if(en_pc && en_uni)
            op = op + 1;
            else
            op = op;
    end

endmodule

