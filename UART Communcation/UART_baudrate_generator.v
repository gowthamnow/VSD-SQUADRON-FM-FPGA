module UART_BaudRate_generator(
    Clk,
    Rst_n,
    Tick,
    BaudRate
    );

input           Clk;            // 12 MHz Clock input
input           Rst_n;          // Reset input
input [15:0]    BaudRate;       // Value to divide the generator by
output          Tick;           // Generates a tick pulse
reg [15:0]      baudRateReg;    // Counter Register

always @(posedge Clk or negedge Rst_n)
    if (!Rst_n) baudRateReg <= 16'b1;
    else if (Tick) baudRateReg <= 16'b1;
         else baudRateReg <= baudRateReg + 1'b1;

assign Tick = (baudRateReg == BaudRate);

endmodule
