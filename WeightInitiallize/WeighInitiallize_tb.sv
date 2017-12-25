module WeighInitiallize_tb();
	reg Clock,Rst,Start;
	reg [319:0]in[0:29];
	wire signed[9:0] dataRead;
	wire signed[9:0] data;
	wire [9:0]count, count0,count1;
	wire [319:0] outVal;
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		Rst = 1;
		Start = 0;
		in[0] = 319'd200;
		in[1] = 319'd200;
		in[2] = 319'd200;
		in[3] = 319'd200;
		in[4] = 319'd200;
		in[5] = 319'd200;
		in[6] = 319'd200;
		in[7] = 319'd200;
		in[8] = 319'd200;
		in[9] = 319'd200;
		in[10] = 319'd200;
		in[11] = 319'd200;
		in[12] = 319'd200;
		in[13] = 319'd200;
		in[14] = 319'd200;
		in[15] = 319'd200;
		in[16] = 319'd200;
		in[17] = 319'd200;
		in[18] = 319'd200;
		in[19] = 319'd200;
		in[20] = 319'd200;
		in[21] = 319'd200;
		in[22] = 319'd200;
		in[23] = 319'd200;
		in[24] = 319'd200;
		in[25] = 319'd200;
		in[26] = 319'd200;
		in[27] = 319'd200;
		in[28] = 319'd200;
		in[29] = 319'd200;
#100	Rst = 0;
#100	Rst = 1;
#100 Start = 1;
	end
	
	DrowsinessDetector wi(Clock,Rst,Start,in,dataRead,data,outVal,count0,count1);
	
	initial begin
		$monitor("In = %p\nData Read = %d\nData = %d\nOutVal = %d\nCount0 = %d\nCount1 = %d", in, dataRead, data, outVal,count0,count1);
	end 
	
endmodule