module	WeightRAM(
	input		Clock, Rst, // In'1' randomize all weight.
	input 	signed[9:0] D,
	input 	[6:0] Address,
	input 	WE,//'1' write data, '0' read data
	output reg	signed[9:0] Q);

	reg [9:0] REGISTER [64:0];//data should be 480*640*30bits.
	wire clk;
	wire signed[9:0] data;
	integer count = 0;
	
	always @(posedge Clock or negedge Rst)begin
		if(~Rst) begin
			for(count=0;count<65;count=count+1) 
				REGISTER[count] <= 64'b0;
		end
		else begin
				if(!WE)	begin
					Q <= REGISTER[Address];
				end
				else	begin 
					REGISTER[Address]<= D;
				end
			end
	end
endmodule