module WeightUpdate_tb;

reg signed [9:0]weight[0:4];
reg [9:0]delta;
reg sign;
wire signed[9:0]weight_new[0:4];

WeightUpdate #(5) test(weight,delta,sign,weight_new);

initial begin
	weight[0] = 10'b1101011100;
	weight[1] = 10'b1001011100;
	weight[2] = 10'b1001011110;
	weight[3] = 10'b1101000100;
	weight[4] = 10'b1001001000;
	delta = 10'b0000110010;
	sign = 1;
	
	#30
	weight[0] = 10'b1101011100;
	weight[1] = 10'b1001011100;
	weight[2] = 10'b1001011110;
	weight[3] = 10'b1101000100;
	weight[4] = 10'b1001001000;
	delta = 10'b0011001101;
	sign = 0;
end

initial begin
	$monitor("Weight = %p\nDelta = %p\nSign = %p\nWeight_New = %p",weight,delta,sign,weight_new);
	
end
endmodule