module ActivationFunc(
	input  signed [23:0]in,
	output reg [9:0]out
	);
real in_abs,out_T;

always@(*) begin
	//get absolute value of the in
	in_abs = in[23] ? -in : in;
	
	//the formula of activation function is f(X) = 0.5[X/(1+|X|)+1]
	out_T = 500*(in/(1+in_abs)+1);
	
	end 
	
assign out = out_T;
endmodule 