module gamma_lut (
    input  wire [3:0] brightness,  // 0..15
    output reg  [7:0] pwm_value     // 0..255
);

    always @(*) begin
        case (brightness)
            4'd0:  pwm_value = 8'd0;
            4'd1:  pwm_value = 8'd1;
            4'd2:  pwm_value = 8'd3;
            4'd3:  pwm_value = 8'd6;
            4'd4:  pwm_value = 8'd10;
            4'd5:  pwm_value = 8'd16;
            4'd6:  pwm_value = 8'd25;
            4'd7:  pwm_value = 8'd36;
            4'd8:  pwm_value = 8'd50;
            4'd9:  pwm_value = 8'd69;
            4'd10: pwm_value = 8'd92;
            4'd11: pwm_value = 8'd120;
            4'd12: pwm_value = 8'd155;
            4'd13: pwm_value = 8'd196;
            4'd14: pwm_value = 8'd224;
            4'd15: pwm_value = 8'd255;
            default: pwm_value = 8'd0;
        endcase
    end

endmodule
