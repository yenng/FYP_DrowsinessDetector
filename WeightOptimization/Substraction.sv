module Subtraction(
	input [9:0]in1,
	input [9:0]in2, 	//input will always be positive.
	output reg [9:0] out,		
	output reg sign);	// 0 positive, 1 negative.
	

	
	always@(*) begin
		if (in1 > in2) begin
			out <= in1 - in2;
			sign <= 0;
			end
		else begin
			out <= in2 - in1;
			sign <= 1;
		end
	end
endmodule
		