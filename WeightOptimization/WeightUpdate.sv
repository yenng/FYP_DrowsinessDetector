module WeightUpdate#(parameter N=10)(
	input signed [9:0]weight[0:N-1],
	input [9:0]delta,
	input sign,
	output reg signed [9:0]weight_new[0:N-1]);
	integer i;
	always@(*) begin
		if (sign ==0) begin
		  for (i = 0; i<N; i=i+1)
			 weight_new[i] <= weight[i] + delta;
			end
		else begin
		  for (i = 0; i<N; i=i+1)
			 weight_new[i] <= weight[i] - delta;
			end
		end
endmodule 