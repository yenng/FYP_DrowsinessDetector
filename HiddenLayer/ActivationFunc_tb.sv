module ActivationFunc_tb;

//input
reg [9:0]in;

//output
wire [9:0]out;
wire [9:0]out1;
wire [9:0]out2;
wire [9:0]out3;
initial begin
	in = 10'b1111111111;
	forever #5 in = in - 1'b1;
	

end

ActivationFunc test(in,out,out1,out2,out3);

endmodule
