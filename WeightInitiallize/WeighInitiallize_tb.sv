module WeighInitiallize_tb();
	reg Clock,Rst;
	wire signed[9:0]dataRead;
	wire signed[9:0] data;
	wire [9:0]count;
	
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		Rst = 1;
#100	Rst = 0;
#100	Rst = 1;
	end
	
	DrowsinessDetector wi(Clock,Rst,dataRead,data);
	
	initial begin
		$monitor("Data Read = %d\nData = %d\n", dataRead,data);
	end 
	
endmodule