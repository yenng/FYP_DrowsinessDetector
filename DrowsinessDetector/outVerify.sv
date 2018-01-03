module outVerify(
	input clock,
	input [9:0] in,
	output [6:0] out,
	output out1);
	
	always@(posedge clock) begin
		if(in > 500) begin
			out <= 7'b1111001;
			out1 <= 1;
		end
		else if(in <500)begin
			out <= 7'b1000000;
			out1 <= 0;
		end
		else
			out <= 7'b1111111;
	end 
endmodule 