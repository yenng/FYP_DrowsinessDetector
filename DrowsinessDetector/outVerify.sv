module outVerify(
	input clock,
	input [9:0] in,
	output [6:0] out);
	
	always@(posedge clock) begin
		if(in > 500)
			out = 7'b1111001;
		else if(in <500)
			out = 7'b1000000;
		else
			out = 7'b1111111;
	end 
endmodule 