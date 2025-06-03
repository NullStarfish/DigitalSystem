module encoder(
    input [3:0] D,
    output reg x, y, V
);
    always @(*) begin
        if (D[3]) begin
            x = 1;
            y = 1;
            V = 1;
        end else if (D[2]) begin
            x = 1;
            y = 0;
            V = 1;
        end else if (D[1]) begin
            x = 0;
            y = 1;
            V = 1;
        end else if (D[0]) begin
            x = 0;
            y = 0;
            V = 1;
        end else begin
            V = 0; // No valid input
        end
    end
endmodule