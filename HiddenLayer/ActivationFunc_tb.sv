module ActivationFunc_tb;

//input
reg signed [23:0]in;

//output
wire [9:0]out;
initial begin
	in = 416798;
	#1 in = 0;
	forever #5 in = in + 1'b1;
	

end
initial begin
 $monitor("in = %d\tout = %d",in,out);
end
ActivationFunc test(in,out);

endmodule
