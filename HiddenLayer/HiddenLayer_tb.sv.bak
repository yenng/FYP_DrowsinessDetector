module HiddenLayer_tb;
reg	Clock,Rst,WE,In;
reg	[9:0] inVal[0:9];
wire	[9:0]outVal[0:4];

HiddenLayer	test(Clock, Rst, WE, In, inVal, outVal);

initial begin
	Clock = 0;
	forever #5 Clock = ~Clock;
end

initial begin
		In = 1;
		WE = 0;
		Rst = 1;
		inVal[0] = 10'b1111111111;
		inVal[1] = 10'b1111111111;
		inVal[2] = 10'b1111111111;
		inVal[3] = 10'b1111111111;
		inVal[4] = 10'b1111111111;
		inVal[5] = 10'b1111111111;
		inVal[6] = 10'b1111111111;
		inVal[7] = 10'b1111111111;
		inVal[8] = 10'b1111111111;
		inVal[9] = 10'b1111111111;
#100	Rst = 0;
#100	Rst = 1;
#1000	In = 0;


end

//clk_div		clk1(Clock, Rst, clk);
initial begin
  $monitor("%b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b ",
  inVal[0],inVal[1],inVal[2],inVal[3],inVal[4],inVal[5],inVal[6],inVal[7],inVal[8],inVal[9]);
  end 
endmodule 