module pwm_rgb (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       tick,      // enable pulse
    input  wire [7:0] duty_r,
    input  wire [7:0] duty_g,
    input  wire [7:0] duty_b,
    output wire       pwm_r,
    output wire       pwm_g,
    output wire       pwm_b
);

    reg [7:0] ctr;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            ctr <= 8'd0;
        else if (tick)
            ctr <= ctr + 8'd1;
    end

    // Combinational compares (no extra register weirdness)
    assign pwm_r = (ctr < duty_r);
    assign pwm_g = (ctr < duty_g);
    assign pwm_b = (ctr < duty_b);

endmodule
