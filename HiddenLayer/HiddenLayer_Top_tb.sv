module HiddenLayer_top_tb();
	reg Clock, Rst;
	reg [9:0]weight,inVal;
	wire [9:0] outVal;
	
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		Rst = 1;
		weight = 10'd100;
		inVal = 10'd230;
		#100 	Rst = 0;
		#100 	Rst = 1;
		#20 	weight = 10'd300;
				inVal = 10'd10;
		#20	weight = 10'd20;
				inVal = 10'd100;		
	end 
	
	HiddenLayer_top top(Clock,Rst,weight,inVal,outVal);
	
	initial begin
		$monitor("InVal = %d\nWeight = %d\nOutVal = %d", inVal, weight,outVal);
	end
endmodule 