module lights(
    input turn_li,
    input turn_hili,
    input fast_hili,
    output hi_l1,
    output hi_l2,
    output hi_r1,
    output hi_r2,
    output low_l1,
    output low_r1
    );
    
    assign low_l1 = turn_li;
    assign low_r1 = turn_li;
    assign hi_l1 = (turn_hili & turn_li) | !fast_hili;
    assign hi_l2 = (turn_hili & turn_li) | !fast_hili;
    assign hi_r1 = (turn_hili & turn_li) | !fast_hili;
    assign hi_r2 = (turn_hili & turn_li) | !fast_hili;
    
endmodule
