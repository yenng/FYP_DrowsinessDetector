module HiddenLayer_top(
	input Clock, Clear, 
	input [9:0]weight,
	input [9:0]inVal,
	output reg [9:0]outVal);
	
	reg [9:0]mulVal;
	
	always@(posedge Clock ) begin
		if(Clear) begin
			outVal = 10'b0;
		end
		else begin
			outVal = outVal + mulVal;
		end
	end
	
	multiply mul(inVal,weight,mulVal);

endmodule