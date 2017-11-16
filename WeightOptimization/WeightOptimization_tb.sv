module WeightOptimization_tb;
reg	Clock,Rst,WE,In;
reg [9:0]out1_actual[0:2];
reg [9:0]out1_cal[0:2];
reg [9:0]out_cal[0:4];
wire [9:0]out1_err[0:2];
wire [2:0]sign;
wire [9:0]delta1[0:2];

WeightOptimization	test(Clock, Rst, WE, In, out1_actual, out1_cal,out_cal,delta1);

initial begin
	out1_actual[0] = 10'b0111010010;
	out1_actual[1] = 10'b1100101100;
	out1_actual[2] = 10'b0010010100;
	out1_cal[0] = 10'b1111001101;
	out1_cal[1] = 10'b0000001101;
	out1_cal[2] = 10'b0010101010;
end

initial begin
	$monitor("out1_actual:	%p\nout1_cal:	%p\ndelta1:	%p\n", out1_actual[0:2], out1_cal[0:2],delta1[0:2]);
end

endmodule	