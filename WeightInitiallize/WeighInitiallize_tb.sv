module WeighInitiallize_tb();
	reg Clock,Rst,In,WE;
	wire signed[9:0]dataRead;
	wire signed[9:0] data;
	wire [9:0]count;
	
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		In = 1;
		WE = 1;
		Rst = 1;
#100	Rst = 0;
#100	Rst = 1;
#1000	In = 0;
		WE = 0;
	end
	
	WeighInitiallize wi(Clock,Rst,In,WE,dataRead,data,count);
	
	initial begin
		$monitor("Data Read = %d\nData = %d\nCount = %d", dataRead,data,count);
	end 
	
endmodule