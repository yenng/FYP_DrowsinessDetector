module WeightUpdate(
	input [9:0]weight,
	input [9:0]delta,
	input sign,
	output reg [9:0]weight_new);
	
	always@(*) begin
		if (sign ==0) begin
			weight_new <= weight + delta;
			end
		else begin
			weight_new <= weight - delta;
			end
		end
endmodule 