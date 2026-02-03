module tick_gen #(
    parameter integer DIV = 1   // tick every DIV clk cycles
)(
    input  wire clk,
    input  wire rst_n,
    output reg  tick
);
    integer cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt  <= 0;
            tick <= 1'b0;
        end else begin
            tick <= 1'b0;
            if (cnt == DIV-1) begin
                cnt  <= 0;
                tick <= 1'b1;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end
endmodule
