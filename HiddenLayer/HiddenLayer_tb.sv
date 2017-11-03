module HiddenLayer_tb;
reg	Clock,Rst,WE,In;
reg	[9:0] inVal[0:9];
wire	[9:0]outVal[0:4];
wire [9:0]outVal1[0:2];
wire [9:0] weight[0:64];

HiddenLayer	test(Clock, Rst, WE, In, inVal, outVal,outVal1,weight);

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
#200
  $display("Input value = %p", inVal);
  $monitor("Weight0_0 = %p\nWeight0_1 = %p\nWeight0_2 = %p\nWeight0_3 = %p\nWeight0_4 = %p\nOutput (Hidden Layer) = %p
  Output(Output Layer) = %p", weight[0:9], weight[10:19], weight[20:29], weight[30:39], weight[40:49], outVal, outVal1);
  
end 
endmodule 