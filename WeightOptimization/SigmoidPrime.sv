module SigmoidPrime(
	input [9:0]in,
	output reg [9:0]out
	);
	
	always@(*) begin
		out <= 500 * 1000  *1000 / (1000+in)  / (1000+in);
	end
	
endmodule