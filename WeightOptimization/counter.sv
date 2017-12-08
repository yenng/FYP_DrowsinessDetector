module counter(
	input clk,rst,
	input [9:0]max,
	output reg[9:0]count
);


always@(posedge clk) begin
	if(~rst) begin
		count = 10'b0;
	end
	else begin
		if(count == max)begin
			count = 10'b0;
		end
		else begin
			count++;
		end
	end
end

endmodule