module comp #(parameter n = 4) (a, b, agb, aeb, alb);
    
    input [n-1:0] a, b;
    output agb, aeb, alb;

    assign agb = a > b;
    assign aeb = a == b;
    assign alb = a < b;
endmodule