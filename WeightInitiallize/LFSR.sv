module LFSR(
  input  clk, rst_n, on,
  output reg signed [9:0] data
);

wire feedback = data[9] ^ data[6] ;

always @(posedge clk or negedge rst_n)
	if (~rst_n) 
		data <= 10'hF;
	else begin
		if(on)
			data <= {data[8:0], feedback} ;
	end
endmodule