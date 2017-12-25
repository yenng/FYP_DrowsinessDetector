module	WeightRAM(
	input		Clock, Rst, // In'1' randomize all weight.
	input 	signed[9:0] D,
	input 	[7:0] Address,
	input 	WE,//'1' write data, '0' read data
	output reg	signed[9:0] Q);

	// Input is 320*30 bit data. 30 input neurons.
	// Hidden Layer has 5 hidden neurons.
	// Output Layer has 3 output neurons.
	// So the total weights needed is 165. (150 for in->hidden, 15 for hidden->out)
	reg [9:0] REGISTER [164:0];
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