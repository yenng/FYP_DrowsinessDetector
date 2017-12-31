module counter(
	input clk,start,
	input [9:0]max,
	output reg stop,
	output reg[9:0]count
);


always@(posedge clk or negedge start) begin
	if (~start) begin
		count = 10'b0;
		stop = 0;
	end
	else begin
		if(count == max-1)begin
			stop = 1;
		end
		else begin
			count++;
		end
	end
end

endmodule