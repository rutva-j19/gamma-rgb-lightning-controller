module top (
    input  wire clk,
    input  wire rst_n,
    output wire pwm_r,
    output wire pwm_g,
    output wire pwm_b
);

    wire tick;

    // breathing brightness (0..15)
    reg  [3:0] brightness;
    reg        dir; // 0 up, 1 down

    // slow down breathing relative to PWM tick
    reg [7:0] anim_div;   // counter
    localparam integer ANIM_RATE = 30; // adjust speed

    // gamma corrected duty (0..255)
    wire [7:0] duty;

    // generate a single tick (PWM stepping tick)
    tick_gen #(
        .DIV(1)
    ) u_tick (
        .clk(clk),
        .rst_n(rst_n),
        .tick(tick)
    );

    // breathing update every ANIM_RATE ticks
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            brightness <= 4'd0;
            dir        <= 1'b0;
            anim_div   <= 8'd0;
        end else if (tick) begin
            if (anim_div == ANIM_RATE-1) begin
                anim_div <= 8'd0;

                if (!dir) begin
                    if (brightness == 4'd15) begin
                        dir <= 1'b1;
                        brightness <= 4'd14;
                    end else brightness <= brightness + 4'd1;
                end else begin
                    if (brightness == 4'd0) begin
                        dir <= 1'b0;
                        brightness <= 4'd1;
                    end else brightness <= brightness - 4'd1;
                end

            end else begin
                anim_div <= anim_div + 8'd1;
            end
        end
    end

    // gamma LUT
    gamma_lut u_gamma (
        .brightness(brightness),
        .pwm_value(duty)
    );

    // PWM channels
    pwm_rgb u_pwm (
        .clk(clk),
        .rst_n(rst_n),
        .tick_pwm(tick),

        //PURPLE breathing: R + B, G off
        .duty_r(duty),
        .duty_g(8'd0),
        .duty_b(duty),

        .pwm_r(pwm_r),
        .pwm_g(pwm_g),
        .pwm_b(pwm_b)
    );

endmodule
