module _7SegmentDisplay(
	input [9:0]in,
	output reg [7:0]_7seg
	);
	
	always@(in) begin
	/*
		if(in == 10'd500)
			_7seg =8'b10010010;
		else if(in > 10'd500)
			_7seg =8'b11111001;
		else
			_7seg =8'b11000000;
		*/	
		
		case(in[9:0])
			10'd0: _7seg =8'b11000000;
			10'd1: _7seg =8'b11111001;
			10'd2: _7seg =8'b10100100;
			10'd3: _7seg =8'b10110000;
			10'd4: _7seg =8'b10011001;
			10'd5: _7seg =8'b10010010;
			10'd6: _7seg =8'b10000010;
			10'd7: _7seg =8'b11111000;
			10'd8: _7seg =8'b10000000;
			10'd9: _7seg =8'b10010000;
			10'd10: _7seg=8'b10001000;
			10'd11: _7seg=8'b10000011;
			10'd12: _7seg=8'b11000110;
			10'd13: _7seg=8'b10100001;
			10'd14: _7seg=8'b10000110;
			10'd15: _7seg=8'b10001110;
			10'd500: _7seg =8'b00000001;
			default: _7seg=8'b0;
		endcase
		
	end
	
endmodule 