`timescale 1ns/1ps

module top_tb;

    reg hw_clk;
    reg rst;
    wire [7:0] q;

    // Instantiate the DUT (Device Under Test)
    top uut (
        .q(q),
        .hw_clk(hw_clk),
        .rst(rst)
    );

    // Generate a 12 MHz clock (Period = 83.33 ns)
    always #41.67 hw_clk = ~hw_clk;

    initial begin
        // Initialize signals
        hw_clk = 0;
        rst = 0;

        // Apply reset
        #100;
        rst = 1;

        // Run simulation for some time
        #1000000;  // 1 ms

        $finish;
    end

    // Dump waveforms for viewing in GTKWave
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

endmodule

