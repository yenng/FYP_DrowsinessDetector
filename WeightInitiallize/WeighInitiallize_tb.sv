module WeighInitiallize_tb();
	reg Clock,Rst,Start;
	reg [9:0]in[0:9];
	wire signed[9:0] dataRead;
	wire signed[9:0] data;
	wire [9:0]count, outVal;
	
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		Rst = 1;
		Start = 0;
		in[0] = 10'd200;
		in[1] = 10'd200;
		in[2] = 10'd200;
		in[3] = 10'd200;
		in[4] = 10'd200;
		in[5] = 10'd200;
		in[6] = 10'd200;
		in[7] = 10'd200;
		in[8] = 10'd200;
		in[9] = 10'd200;
#100	Rst = 0;
#100	Rst = 1;
#100 Start = 1;
	end
	
	DrowsinessDetector wi(Clock,Rst,Start,in,dataRead,data,outVal);
	
	initial begin
		$monitor("In = %p\nData Read = %d\nData = %d\nOutVal = %d", in, dataRead, data, outVal);
	end 
	
endmodule