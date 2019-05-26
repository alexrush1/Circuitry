module timer 
#(parameter delay_bit = 23) 
( 
input clock, 
input reset, 
output finish 
); 

reg [delay_bit:0] counter; 

always @(posedge clock, posedge reset) 
begin 
if (reset) 
counter <= 0; 
else if (!counter[delay_bit]) 
counter <= counter + 1; 
end 

assign finish = counter [delay_bit]; 
endmodule