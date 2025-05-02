`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2025 22:42:01
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: ALU with shift, rotate, arithmetic, logic, and compare operations
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU(en,codes, operand1, operand2, final, cb);
input [7:0] codes, operand1, operand2;
input en;
output reg [7:0] final;
output reg cb;
reg [15:0] mult_result;

wire [7:0]D;
assign D = mult_result[15:8];
ext external(D, en);

reg [3:0] x, y;

always @(*) begin
    x = codes[7:4];
    y = codes[3:0];

    cb = 0;       
    final = 0;    
    mult_result = 0;
    if(en)
    begin
    case(x)
        0: begin
            if(y == 1) begin
                final = operand1 << 1;              
            end
            else if(y == 2) begin
                final = operand1 >> 1;              
            end
            else if(y == 4) begin
                final = {operand1[6:0], operand1[7]};
            end
            else if(y == 3) begin
                final = {operand1[0], operand1[7:1]}; 
            end
            else if(y == 5) begin
                final = {operand1[7], operand1[7:1]}; 
            end
            else if(y == 6) begin
                final = operand1 + 1;               
                cb = (operand1 == 8'b11111111);     
            end
            else if(y == 7) begin
                final = operand1 - 1;              
                cb = (operand1 == 8'b00000000);    
            end
            else begin
                final = 0;
                cb= 0;
            end
        end
        1: begin
            {cb,final} = operand1 + operand2;                                    
        end
        2: begin
            {cb,final} = operand1 - operand2;                                    
        end
        3: begin
            mult_result = operand1 * operand2;  
            final = mult_result[7:0]; 
        end
        5: begin
            final = operand1 & operand2;          
        end
        6: begin
            final = operand1 ^ operand2;           
        end
        7: begin
            if(operand1 >= operand2)
                cb = 0;
            else
                cb = 1;
        end
        
        
        default: begin
            final = 8'b00000000;
        end
    endcase
   end   
end

endmodule