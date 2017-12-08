module clk_div
#(
parameter WIDTH = 4,
parameter N = 5)(
input clk, rst,
output clk_out);

reg[WIDTH-1:0] r_reg;
wire [WIDTH-1:0] r_nxt;
reg clk_track;
 
always @(posedge clk or negedge rst)begin
	if (~rst)begin
		r_reg <= 0;
		clk_track <= 1'b0;
	end
	else if (r_nxt == N)begin
		r_reg <= 0;
		clk_track <= ~clk_track;
	end
	else 
		r_reg <= r_nxt;
end
 
assign r_nxt = r_reg+1;   	      
assign clk_out = clk_track;
endmodule
 