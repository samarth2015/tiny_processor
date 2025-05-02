`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 11:17:33 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    clk
    );
    
    input clk;

    reg rst = 0;
    
    wire [4:0] pc;
    reg en_pc;
    reg en_uni = 1;
    program_counter count(rst,clk,en_pc,en_uni, pc);
    
    wire [7:0]instruction;
    wire [3:0] x, y;
    instructions ins(pc,instruction);
    
    assign x = instruction[7:4];
    assign y = instruction[3:0];
    
//    assign x = instruction[7:4];
//    assign y = instruction[3:0];
    
    
    wire [7:0] op;
    reg [7:0] data;
    reg [15:0]en_bank;
    register_bank bank (y, y, en_bank, data, rst, op);
    
    
    wire [7:0] op_acc;
    reg [7:0] acc_val;
    reg en_acc;
    acc accumu(acc_val, en_acc, rst, op_acc);
    
    reg [7:0] output_alu;
    wire [7:0] final;
    wire cb;
    reg en_alu;
    ALU arith(en_alu, instruction, op_acc, op, final, cb);
    
    
    reg [1:0] curr, next;
    parameter EXE = 1'b0, WRITE = 1'b1;
    


    always @(posedge clk)
    begin
        if(!rst)
        begin
            rst = 1;
            en_pc = 0;
            curr = EXE;
        end    
        
        
        if(curr == WRITE)   
        begin
            
            en_pc=1;
             if(x == 1 || x==2 || x==3 || x==5 || x==6 || (x==0 && (y==1|| y==2 || y==3 || y==4 || y==5 || y==6 || y==7)))
             begin
                en_alu=0;
                en_acc=1;
                acc_val=final;
             end
             else if(x==7)
                en_acc=0; 
             else if(x==9)
             begin
                en_acc=1;
                acc_val=op;
             end
             else if(x==10)
             begin
                en_bank=1<<y;
                data=op_acc;
             end
             if(x==15 && y==15)
                begin
                    en_uni = 0;
                end
             curr = EXE;
        end 
    end    
    
    always @(x,y)
    begin
        case(curr)
            EXE:
            
            begin
            en_pc=0;
            if(x==15 && y==15)
                begin
                
                end
                if(x == 1 || x==2 || x==3 || x==5 || x==6 || x==7 || (x==0 && (y==1|| y==2 || y==3 || y==4 || y==5 || y==6 || y==7)))
                begin
                    en_alu=1;
                    
                end
//                else if(x == 0 && y==1)
//                begin
//                    en_alu=1;
//                end
////                else if(x == 10)
//                begin
                
//                end

                curr=WRITE;
             end
//           
             endcase
             
//             curr = next;
    end


endmodule
