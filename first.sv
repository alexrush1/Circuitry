module first(
    input l_door,
    input r_door,
    output lamp
    );
    
    assign lamp = l_door | r_door;
    
endmodule
