`timescale 1ns / 1ps

module bitcreator(
    input clk, 
    input [71:0] colordata, 
    output logic cled
    );

logic [5:0] cyc;                            // 15 clocks to form a bit cycle
logic [4:0] cnt;                            // 24 bit cycles to form a LED frame`
logic [5:0] coloraddr ;     // 3 empty frames forming reset and then loaded LED frames    
logic zerobit;
logic onebit;

always @(posedge clk) 
   begin
   cyc <= (cyc<(32-1)) ? cyc+1 : 0;
   zerobit <= (cyc > 1) & (cyc <= 16);
   onebit <= (cyc > 1) & (cyc <= 22);
   
   if (cyc == (32-1))           // The last tick
        begin 
        cnt <= (cnt < 23) ? cnt+1 : 0;   
        if (cnt == 23) coloraddr <= (coloraddr < 19) ? coloraddr+1 : 0;
        end
   
   if (coloraddr < 16) cled <= 0;          // 48*15 cycles form >50us reset
   else cled <= (colordata[((coloraddr-16)*24)+cnt]) ? onebit : zerobit;  
  end
 
endmodule