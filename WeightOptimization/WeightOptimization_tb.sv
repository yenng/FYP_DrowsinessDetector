module WeightOptimization_tb;
reg	Clock,Rst,WE,In;
reg [9:0]out1_actual[0:2];
reg [9:0]out1_cal[0:2];
reg [9:0]out0_cal[0:4];
wire [9:0]out1_err[0:2];
wire [9:0]delta1[0:2];
wire [9:0]delta0[0:4];

WeightOptimization	test(Clock, Rst, WE, In, out1_actual, out1_cal,out0_cal,delta1,delta0);

initial begin
	Clock = 0;
	forever #5 Clock = ~Clock;
end

initial begin
  In = 1;
  WE = 0;
  Rst = 1;
	out1_actual[0] = 10'b0000000001;
	out1_actual[1] = 10'b1111100111;
	out1_actual[2] = 10'b0000000001;
	out0_cal[0] = 10'b0000000001;
	out0_cal[1] = 10'b1111100111;
	out0_cal[2] = 10'b0000000001;
	out0_cal[3] = 10'b1111100111;
	out0_cal[4] = 10'b1111100111;
	out1_cal[0] = 10'b1111001101;
	out1_cal[1] = 10'b0000001101;
	out1_cal[2] = 10'b0010101010;

#100
  Rst = 0;
  
#100
  Rst = 1;

#1000
  In = 0;
  
end

initial begin
	$monitor("delta0 = \n%p\ndelta1 = \n%p", delta0[0:4],delta1[0:2]);
end

endmodule	