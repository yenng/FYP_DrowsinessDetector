module ActivationFunc(
	input  signed [23:0]in,
	output reg out
	);
reg signed[23:0] in_abs;
reg [10:0] out_T;

always@(*) begin
	//get absolute value of the in
	in_abs = in[23] ? -in : in;
	
	//the formula of activation function is f(X) = 0.5[X/(1+|X|)+1]
	out_T = (in*1000/(1+in_abs)+1000)/2;
	
	if(out_T > 500)
	  out = 1;
	else
	  out = 0;
	end 
	

endmodule 