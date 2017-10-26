module WeighInitiallizemodule#(parameter N=10)(
	input		Clock,In, Rst, // In'1' randomize all weight.
	input 	[9:0] D[0:N-1],
	input 	[6:0] Address,
	input 	WE,//'1' write data, '0' read data
	output 	reg	[9:0] Q[0:N-1]);
	//output	reg [9:0] REGISTER [64:0]);

	reg [9:0] REGISTER [64:0];
	wire clk;
	wire [9:0] data;
	integer i = 0;
	integer count = 0;
	
	always @(posedge Clock)begin
		if(In) begin
			if(count < 65) begin
				REGISTER[count] <= data;
				count = count +1;
			end
			else
				count = 0;
		end
	end			
	
	always @(posedge clk or negedge Rst)begin
	if(~Rst) begin
		for(i=0;i<N;i=i+1)
			Q[i] <= 10'b0000000000;
	end
	else begin
		if(~In)	begin
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
	end
	LFSR rndnm(Clock, Rst, data);
	clk_div clk1(Clock, Rst, clk);
endmodule