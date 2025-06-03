module diffre 
    #(
        parameter n = 1
    )   
    (
        input clk,
        input r,
        input en,
        input [n - 1 : 0] d,
        output reg [n - 1:0] q
    );
    always@(posedge clk) begin
        if(r) q <= 0;
        else begin
            if (en) q <= d;
            else q <= q;
        end
    end
endmodule