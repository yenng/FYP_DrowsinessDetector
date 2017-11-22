module WeightOptimization_tb;
reg	Clock,Rst,WE,In;
reg [9:0]out1_actual[0:2];
reg [9:0]out1_cal[0:2];
reg [9:0]out_cal[0:4];
wire [9:0]out1_err[0:2];
wire [2:0]sign;
wire [9:0]delta1[0:2];
reg signed[9:0]weight_old[0:4];
wire signed[9:0]weight_new[0:4];

WeightOptimization	test(Clock, Rst, WE, In, out1_actual, out1_cal,out_cal,weight_old,delta1,weight_new);

initial begin
	out1_actual[0] = 10'b0111010010;
	out1_actual[1] = 10'b1100101100;
	out1_actual[2] = 10'b0010010100;
	out1_cal[0] = 10'b1111001101;
	out1_cal[1] = 10'b0000001101;
	out1_cal[2] = 10'b0010101010;
end

initial begin
	$monitor("out1_actual:	%p\nout1_cal:	%p\ndelta1:	%p\nWeight_old:\n%p\nWeight_new:\n%p", 
	out1_actual[0:2], out1_cal[0:2],delta1[0:2],weight_old,weight_new);
end

endmodule	