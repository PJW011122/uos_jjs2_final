module SUB_oneshot(clk, rst, btn, btn_trig);

// 변수 선언
parameter WIDTH = 1;
input clk, rst;
input [WIDTH-1:0] btn;
reg [WIDTH-1:0] btn_reg;
output reg [WIDTH-1:0] btn_trig;

// oneshot trigger block
always @(negedge rst or posedge clk) begin
    if(!rst) begin
        btn_reg <= {WIDTH{1'b0}};
        btn_trig <= {WIDTH{1'b0}};
    end
    else begin
        btn_reg <= btn;
        btn_trig <= btn & ~btn_reg;
    end
end

endmodule