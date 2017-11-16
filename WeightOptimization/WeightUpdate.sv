module WeightUpdate#(parameter N=10)(
	input [9:0]weight[0:N-1],
	input [9:0]delta,
	input sign,
	output reg [9:0]weight_new[0:N-1]);
	
	always@(*) begin
		if (sign ==0) begin
			weight_new[0] <= weight[0] + delta;
			end
		else begin
			weight_new[0] <= weight[0] - delta;
			end
		end
endmodule 