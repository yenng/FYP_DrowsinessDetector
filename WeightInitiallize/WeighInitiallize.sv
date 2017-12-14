module WeighInitiallize(
	input Clock,Rst,In,WE,
	output signed[9:0] dataRead,
	output signed[9:0] data,
	output [9:0]count);
	reg [6:0] Address;
	wire clk_slow;
	
	LFSR rndnm(Clock, Rst, data);
	counter count65(Clock, Rst, 10'd65,count);
	WeightRAM ram(Clock, In, Rst, data,count, WE, dataRead);
endmodule 