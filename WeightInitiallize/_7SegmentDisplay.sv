module _7SegmentDisplay(
	input [3:0]in,
	output [7:0]_7seg
	);
	
	always@(in) begin
		case(in)
			4'd0: _7seg =8'b11000000;
			4'd1: _7seg =8'b11111001;
			4'd2: _7seg =8'b10100100;
			4'd3: _7seg =8'b10110000;
			4'd4: _7seg =8'b10011001;
			4'd5: _7seg =8'b10010010;
			4'd6: _7seg =8'b10000010;
			4'd7: _7seg =8'b11111000;
			4'd8: _7seg =8'b10000000;
			4'd9: _7seg =8'b10010000;
			4'd10: _7seg=8'b10001000;
			4'd11: _7seg=8'b10000011;
			4'd12: _7seg=8'b11000110;
			4'd13: _7seg=8'b10100001;
			4'd14: _7seg=8'b10000110;
			4'd15: _7seg=8'b10001110;
		endcase
	end
	
endmodule 