`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2019 13:19:34
// Design Name: 
// Module Name: decoder
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


module desh(
    input [3:0]in,
    output reg [6:0]led
    );
    logic [3:0]zatup;
    assign zatup=~in;
always @(*)
begin    
    case (zatup)
    4'b0000 : led = 7'b0111111;
    4'b0001 : led = 7'b0000110;
    4'b0010 : led = 7'b1011011;
    4'b0011 : led = 7'b1001111;
    4'b0100 : led = 7'b1100110;
    4'b0101 : led = 7'b1101101;
    4'b0110 : led = 7'b1111101;
    4'b0111 : led = 7'b0000111;
    4'b1000 : led = 7'b1111111;
    4'b1001 : led = 7'b1101111;
    endcase; 
 end   
endmodule
