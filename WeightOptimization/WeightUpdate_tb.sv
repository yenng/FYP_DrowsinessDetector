module WeightUpdate_tb;

reg [9:0]weight;
reg [9:0]delta;
reg sign;
wire [9:0]weight_new;

WeightUpdate test(weight,delta,sign,weight_new);

initial begin
	weight = 10'b1101011100;
	delta = 10'b0000110010;
	sign = 1;
	
	#30
	weight = 10'b1001110000;
	delta = 10'b0011001101;
	sign = 0;
end

initial begin
	$monitor("Weight = %d\nDelta = %d\nSign = %d\nWeight_New = %d",weight,delta,sign,weight_new);
	
end
endmodule