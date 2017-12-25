module HiddenLayer_top(
	input Clock, Clear, 
	input signed [9:0]weight,
	input [319:0]inVal,
	//input [639:0]testVal[0:479],
	output reg signed[319:0]outVal);
	
	reg [319:0]mulVal;
	reg [9:0]addVal;
	
	always@(posedge Clock, negedge Clear)begin 
		if(~Clear) begin
			if(mulVal)
				outVal = outVal + mulVal;
			else
				outVal = outVal + 0;
			end
		else begin
			outVal = 320'd0;
		end
	end
	
	multiply mul(inVal,weight,mulVal);

endmodule