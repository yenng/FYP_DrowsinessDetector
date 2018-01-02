module	WeightRAM(
	input		Clock, Rst, // In'1' randomize all weight.
	input 	signed[9:0] D[149:0],
	input 	WE,//'1' write data, '0' read data
	output reg	signed[9:0] Q[149:0]);

	// Input is 10*30 bit data. 30 input neurons.
	// Hidden Layer has 5 hidden neurons.
	// Output Layer has 3 output neurons.
	// So the total weights needed is 165. (150 for in->hidden, 15 for hidden->out)
	reg [9:0] REGISTER[149:0];
	integer count = 0;
	
	always @(posedge Clock)begin
		if(~Rst) begin
			for(count=0;count<165;count=count+1) 
				REGISTER[count] = 10'b0;
		end
		else begin
				if(!WE)	begin
					Q = REGISTER;
				end
				else	begin 
					REGISTER= D;
				end
			end
	end
endmodule