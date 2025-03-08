module abs_dif (aIn, bIn, out);
    input [3:0] aIn, bIn;
    output [3:0] out;

    // Comparator instance
    wire agb;
    comp #(.n(4)) comp_inst (.a(aIn), .b(bIn), .agb(agb), .aeb(), .alb());

    // Data selector instance - select larger and smaller numbers
    wire [3:0] max, min;
    mux_2to1 #(.n(4)) mux1 (.out(max), .in0(bIn), .in1(aIn), .addr(agb));
    mux_2to1 #(.n(4)) mux2 (.out(min), .in0(bIn), .in1(aIn), .addr(~agb));

    // Perform subtraction using two's complement
    wire [2:0] c;
    wire [3:0] complement_min;
    assign complement_min = ~min + 1;  // Two's complement

    // Add max and two's complement of min
    full_adder adder0 (.a(max[0]), .b(complement_min[0]), .s(out[0]), .ci(1'b0), .co(c[0]));
    full_adder adder1 (.a(max[1]), .b(complement_min[1]), .s(out[1]), .ci(c[0]), .co(c[1]));
    full_adder adder2 (.a(max[2]), .b(complement_min[2]), .s(out[2]), .ci(c[1]), .co(c[2]));
    full_adder adder3 (.a(max[3]), .b(complement_min[3]), .s(out[3]), .ci(c[2]), .co());

endmodule