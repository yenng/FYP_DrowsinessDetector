module HiddenLayer_top(
	input Clock, Clear, 
	input signed [9:0]weight,
	input [9:0]inVal,
	output reg [9:0]outVal);
	
	reg [9:0]mulVal;
	
	always@(posedge Clock ) begin
		if(Clear) begin
			outVal = 10'b0;
		end
	end
	
	always@(mulVal)begin 
		outVal = outVal + mulVal;
	end
	
	multiply mul(inVal,weight,mulVal);

endmodule