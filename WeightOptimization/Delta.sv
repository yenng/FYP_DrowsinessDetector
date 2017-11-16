module Delta(
	input [9:0]err,
	input [9:0]sig_prime,
	output reg [9:0]delta
	);
	
	always@(*) begin
		delta = err * sig_prime / 1000;
	end
endmodule
