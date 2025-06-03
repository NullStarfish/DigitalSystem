module rsff 
    (
        input clk,
        input r,
        input s,
        output reg q = 0
    );
    always@(posedge clk) begin
        if (r) q <= 0;
        else if (s&~r) q <= 1;
    end
endmodule