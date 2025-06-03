module divider #(parameter freq = 1000, parameter qref = 1)(
    input clk_100Mhz,
    input rstn,
    output reg clk_out = 1
    );
    integer cnt = 0;
    always @ (posedge clk_100Mhz or negedge rstn) begin
        if(!rstn) cnt <= 0;
        else if(cnt == 100000000 / freq / 2 * qref - 1) begin
            cnt <= 0;
            clk_out <= !clk_out;
        end
        else cnt <= cnt + 1;
    end

endmodule