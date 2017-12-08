module ActivationFunc(
	input  signed [13:0]in,
	output reg [9:0]out
	);
reg signed[13:0] in_abs;
reg [9:0] out_T;

always@(*) begin
	//get absolute value of the in
	in_abs = in[13] ? -in : in;
	
	//the formula of activation function is f(X) = 0.5[X/(1+|X|)+1]
	out_T = (in*1000/(1+in_abs)+1000)/2;
	
	end 
assign out = out_T;

endmodule 