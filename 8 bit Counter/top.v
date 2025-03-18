`timescale 1ns/1ps

module top(
    output [7:0] q,
    input hw_clk,
    input rst
);
    wire c_out;

    // Instantiate the clock divider
    clockdivider clk_div(
        .c_out(c_out),
        .clk(hw_clk),
        .rst(rst)
    );

    // Instantiate the counter
    counter cnt(
        .q(q),
        .clk(c_out),
        .rst(rst)
    );

endmodule

module clockdivider(
    output reg c_out,
    input clk,
    input rst
);
    reg [23:0] count;  // Reduced bit size to fit the clock divider calculation

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            c_out <= 0;
            count <= 0;
        end else if (count == 5999999) begin  // (12 MHz / 2 Hz) / 2 = 6 million
            count <= 0;
            c_out <= ~c_out;
        end else begin
            count <= count + 1;
        end
    end
endmodule

module counter(
    output reg [7:0] q,
    input clk,
    input rst
);
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            q <= 8'b00000000;
        end else begin
            q <= q + 1;
        end
    end 
endmodule
