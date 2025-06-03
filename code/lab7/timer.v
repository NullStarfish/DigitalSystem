//timer 和counter 最大的区别就是counter会取模，而timer不会取模，只会触发一次
//不关心done结束后的状态
module timer 
    #(
        parameter n = 12,
        parameter counter_bits = 4
    )  
    (
        input en,
        input r,
        input clk,
        output done
    );
    wire [counter_bits-1:0] q;
    wire co;
    counter_n #(
        .counter_bits(counter_bits),
        .n(n)
    ) counter_n_inst(
        .clk(clk),
        .en(en),
        .r(r),
        .q(q),
        .co(co)
    );
    assign done = co;
endmodule


