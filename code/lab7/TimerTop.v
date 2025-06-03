module TimerTop(clk, reset, start, LED1, LED0);
    input clk, reset, start;
    output LED1, LED0;
    parameter sim=1'b0;
    wire pulse10Hz, pulse1Hz;
    wire TimerEn, TimerOut;
    wire clr;
    assign LED1 = TimerEn;
    counter_n #(.n(sim?2:10**7), .counter_bits(sim?1:24))Div1(
        .clk(clk),
        .en(1'b1),
        .r(0),
        .q(),
        .co(pulse10Hz)
    );
    counter_n #(.n(10), .counter_bits(4))Div2(
        .clk(clk),
        .en(pulse10Hz),
        .r(0),
        .q(),
        .co(pulse1Hz)
    );
    timer #(.n(12), .counter_bits(4))Timer(
        .en(pulse1Hz && TimerEn),
        .r(reset || start),
        .clk(clk),
        .done(TimerOut)
    );
    rsff ff1(.clk(clk), .r(reset || TimerOut), .s(start), .q(TimerEn));
    rsff ff2(.clk(clk), .r(TimerOut), .s(reset || start), .q(clr));
    diffre #(.n(1)) Diffre(
        .clk(clk),
        .r(clr),
        .en(pulse10Hz),
        .d(~LED0),
        .q(LED0)
    );
endmodule