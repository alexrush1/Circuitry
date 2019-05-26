`timescale 1ns / 1ps 

module T_light( 
input clk,
output provod 
);  
logic [71:0]bit_array;
logic [1:0]state;  
logic [1:0]next_state;  
wire timer_one_second;
logic timer_one_second_reset;
timer one_second(.clock(clk), .reset(timer_one_second_reset), .finish(timer_one_second));
bitcreator bitcreator(.clk(clk), .colordata(bit_array), .cled(provod));

parameter state_green = 2'b00;
parameter state_yellow1 = 2'b01;
parameter state_red = 2'b10;
parameter state_yellow2 = 2'b11;

    
always @(posedge clk)
begin
        timer_one_second_reset = 0;
        next_state = state;

        case (state)
            0:
               begin
                   if(timer_one_second)
                   begin
                         timer_one_second_reset = 1;
                         next_state = state_yellow1;
                         bit_array <= {24'h000000, 24'h00ffff, 24'h000000};
                   end
               end
               1:
               begin
                   if(timer_one_second)
                   begin
                       timer_one_second_reset = 1;
                       next_state = state_red;
                       bit_array <= {24'h00ff00, 24'h000000, 24'h000000};
                   end
              end
               2:
               begin
                   if(timer_one_second)
                   begin
                       timer_one_second_reset = 1;
                       next_state = state_yellow2;
                       bit_array <= {24'h00ff00, 24'h00ffff, 24'h000000};
                   end
               end
               3:
               begin
                   if(timer_one_second)
                   begin
                       timer_one_second_reset = 1;
                       next_state = state_green;
                       bit_array <= {24'h000000, 24'h000000, 24'h0000ff};
                    end
                end
        endcase
        end
always @(posedge clk)
    state <= next_state;
endmodule
