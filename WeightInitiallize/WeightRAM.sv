module	WeightInitialise#(parameter N=10)(
	input		Clock,In, Rst,
	input 	[9:0] D[0:N-1],
	input 	[6:0] Address,
	input 	WE,//'1' write data, '0' read data
	output 	reg	[9:0] Q[0:N-1]);

	reg [9:0] REGISTER [64:0];
	reg clk = 0;
	wire [9:0] data;
	integer i = 0;
	always @(posedge Clock)begin
	if(In)	begin//Initialise the weight.
		for(i=0;i<N;i=i+1)
    		REGISTER[i] <= data;
	end
	else begin
		if(!WE)	begin
			for(i=0;i<N;i=i+1)
				Q[i] <= REGISTER[Address+i];
			end
		else	begin 
			for(i=0;i<N;i=i+1)
				REGISTER[Address+i]<= D[i];
			end
		end
	end
	LFSR rndnm(Clock, Rst, data);
endmodule