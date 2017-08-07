module WeightInitiallize_tb;

//input
reg Clock, WE, In, Rst;
reg [4:0] address;

//output
wire [0:9]weight[0:9];

initial begin
	Clock = 0;
	forever	#50 Clock = ~Clock;
end

initial begin
		WE = 0;
		In = 1;
		address = 5'b00000;
#500	In = 0;
#500	address = 5'b01010;
#500	address = 5'b10100;
end
//WeighInitiallize test1(Clock, In, Rst, D1, Address, WE, weight);
  initial begin
  $display("weight");
  $monitor("Address = %d\n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b ",address, weight[0],weight[1],weight[2],weight[3],weight[4],weight[5],weight[6],weight[7],weight[8],weight[9]);
  end  
endmodule