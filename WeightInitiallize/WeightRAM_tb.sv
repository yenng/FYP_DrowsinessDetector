module WeightRAM_tb;
//input
reg Clock, In, WE, Rst;
reg [9:0] D1[0:9];
reg [6:0] Address;

//output
wire [9:0] weight[0:9];
wire [9:0] data;
wire clk;
//reg [9:0] REGISTER [64:0];

initial begin
	Clock = 0;
	forever #5 Clock = ~Clock;
end

initial begin
		In = 1;
		WE = 0;
		Rst = 1;
#100	Rst = 0;
#100	Rst = 1;
#1000	In = 0;
		Address = 7'b0000000;
#1000	Address = 7'b0001010;
#1000	Address = 7'b0010100;
#1000	Address = 7'b0011110;
#1000	Address = 7'b0101000;

end

WeightRAM	test1(Clock, In, Rst, D1, Address, WE, weight);
LFSR			rndnm(Clock, Rst, data);
//clk_div		clk1(Clock, Rst, clk);
initial begin
  $monitor("Address = %d\n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b ",
  Address, weight[0],weight[1],weight[2],weight[3],weight[4],weight[5],weight[6],weight[7],weight[8],weight[9]);
  end 
endmodule 