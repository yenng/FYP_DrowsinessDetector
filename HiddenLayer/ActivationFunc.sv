module ActivationFunc(
	input [9:0]in,
	output reg [9:0]out,
	output reg [1024:0]out1,
	output reg [1024:0]out2,
	output reg [9:0]out3
	);
reg [9:0]inPos;

always@(*) begin
	//the formula of activation function is f(X) = 0.5[X/(1+|X|)+1]
	out1 = (1000 * in);
	out2 = out1/(out+1);
	out3 = (out2+1)/2'b10;
	
	//get absolute value of the in
	out = in[9] ? in : in;
	end 
endmodule 