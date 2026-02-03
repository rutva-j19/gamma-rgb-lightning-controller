`timescale 1ns/1ps

module tb_top;

  reg clk = 0;
  reg rst_n = 0;

  wire pwm_r, pwm_g, pwm_b;

  always #5 clk = ~clk;

  top dut (
    .clk(clk),
    .rst_n(rst_n),
    .pwm_r(pwm_r),
    .pwm_g(pwm_g),
    .pwm_b(pwm_b)
  );

  initial begin
    $dumpfile("top.vcd");
    $dumpvars(0, tb_top);

    #20 rst_n = 1;
    #6000;
    $finish;
  end

endmodule

   