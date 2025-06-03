module counter_n #(
    parameter counter_bits = 3,
    parameter n = 2
) (
    input clk,
    input en,
    input r,
    output co,
    output reg [counter_bits-1:0] q
);
    assign co = (q == n)  && en;
    always @(posedge clk) begin
        if(r) q <= 0;
        else begin
            if (en) begin
                if (q == n) q <= 0;
                else q <= q + 1;
            end
        end
    end
endmodule