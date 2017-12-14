module DrowsinessDetector(
	input Clock,Rst,
	output signed[9:0] dataRead,
	output reg signed[9:0] dataIn,
	output [9:0]count);
	reg WE,startCounter;
	wire stopCounter;
	reg signed[9:0] data;
	reg [6:0] Address;
	reg [3:0] state;
	reg [3:0] nextState;
	
	parameter halt = 0,start = 1, readWeight = 2, halt1 = 3;
	
	always@(posedge Clock, negedge Rst) begin
		if(~Rst) begin
			state = halt;
		end
		else begin
			state = nextState;
		end
	end
	
	always@(*) begin
		case(state)
		  // The following state is for weightInitiallize module.
			halt: begin
				startCounter = 0;
				nextState = start;
			end
			start: begin
				WE = 1;
				dataIn = data;
				startCounter = 1;
				if (stopCounter) begin
					nextState = halt1;
				end
			end
			readWeight: begin
				WE = 0;
				startCounter = 1;
			end
			halt1: begin
				startCounter = 0;
				nextState = readWeight;
			end
			// The 4 states above used to initiallize the weight.
		endcase
	end
	
	LFSR rndnm(Clock, Rst, data);
	counter count65(Clock, startCounter, 10'd65,stopCounter,count);
	WeightRAM ram(Clock, Rst, dataIn,count, WE, dataRead);
	
	
endmodule 