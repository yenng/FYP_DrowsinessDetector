
module counter(
	input clk,rst,
	output reg[9:0]count
);


always@(posedge clk) begin
	if(rst) begin
		count = 10'b0;
	end
	else begin
		count++;
	end
end

endmodule