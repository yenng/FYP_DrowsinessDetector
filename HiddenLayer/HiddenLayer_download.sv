module HiddenLayer_download(
	input CLOCK_50,
	input [17:0]SW,
	input [3:0]KEY,
	output [17:0]LEDR,
	output [7:0]LEDG);
		
	always@(posedge CLOCK_50) begin
		
		
	end
	
	HiddenLayer download(
					.Clock(CLOCK_50),
					.Rst(KEY[0]),
					.WE(SW[0]));
	endmodule