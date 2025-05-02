`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 10:54:21 PM
// Design Name: 
// Module Name: register
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

module register(D, en, reset, resetval, Q);
    input [7:0]D, resetval;
    input en, reset;
    output reg [7:0] Q;
    
    always @*
    begin
        if(!reset)
            Q = resetval;
        else
            if(en)
                Q = D;
            else
                Q = Q;
    end

endmodule

