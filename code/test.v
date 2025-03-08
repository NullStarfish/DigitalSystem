module moduleName (
    input reg [3:0] a,
    input clk,
    output b
);
    always @(posedge clk) begin
        a = a + 1;
    end
endmodule