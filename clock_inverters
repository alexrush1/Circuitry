module ledclock(
    input clock,
    output led[7:0]
    );
    (* max_fanout = 2 *) (* dont_touch = "true" *) logic in1[7:0],in2[7:0],in3[7:0],in4[7:0];
    genvar i;
    assign in1[0] = !clock;
    assign in2[0] = !in1[0];
    assign in3[0] = !in2[0];
    assign in4[0] = !in3[0];
    for (i=0; i<7; i=i+1)
    begin
    assign in1[i+1] = !in4[i];
    assign in2[i+1] = !in1[i+1];
    assign in3[i+1] = !in2[i+1];
    assign in4[i+1] = !in3[i+1];
    assign led[i] = in4[i]^clock;
    end
    assign led[7] = in4[7]^clock;
endmodule
