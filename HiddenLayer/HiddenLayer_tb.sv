module HiddenLayer_tb;
reg	Clock,Rst,WE,In;
reg	[9:0] inVal[0:9];
wire	[9:0]outVal[0:4];
wire [9:0]outVal1[0:2];
wire [6:0]address;
wire [6:0]ii;

HiddenLayer	test(Clock, Rst, WE, In, inVal, outVal,outVal1,address,ii);

initial begin
	Clock = 0;
	forever #5 Clock = ~Clock;
end

initial begin
		In = 1;
		WE = 0;
		Rst = 1;
		inVal[0] = 10'b0000000001;
		inVal[1] = 10'b0000000001;
		inVal[2] = 10'b0000000001;
		inVal[3] = 10'b0000000001;
		inVal[4] = 10'b0000000001;
		inVal[5] = 10'b0000000001;
		inVal[6] = 10'b0000000001;
		inVal[7] = 10'b0000000001;
		inVal[8] = 10'b0000000001;
		inVal[9] = 10'b0000000001;
#100	Rst = 0;
#100	Rst = 1;
#1000	In = 0;


end

//clk_div		clk1(Clock, Rst, clk);
initial begin
  $monitor("Input value = %p\nOutput (Hidden Layer) = %p\nOutput(Output Layer) = %p\nAddress = %p\ni = %p", 
  inVal,outVal, outVal1,address,ii);
  
end 
endmodule 