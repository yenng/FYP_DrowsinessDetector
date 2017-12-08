 module HiddenLayer(
	input		Clock,Rst,WE,In,
	input		[9:0] inVal[0:9],
	output reg [9:0]outVal[0:4],
	output reg [9:0]outVal1[0:2],
	output reg [9:0]count,
	output reg [6:0]address
	);
	integer i,j;
	parameter n=10;
	
	reg [6:0]address1;
	
	reg [9:0]max;
	
	// Universal out
	wire [9:0]out0;
	wire [9:0]out1;
	
	// Universal weight
	reg	signed[9:0] weight0[0:9];   
	reg	signed[9:0] weight1[0:4];
	
	reg	signed[9:0] weight0_0[0:9];
	reg	signed[9:0] weight0_1[0:9];
	reg	signed[9:0] weight0_2[0:9];
	reg	signed[9:0] weight0_3[0:9];
	reg	signed[9:0] weight0_4[0:9];
	
	reg	signed[9:0] weight1_0[0:4];
	reg	signed[9:0] weight1_1[0:4];
	reg	signed[9:0] weight1_2[0:4];
	
	always@(posedge Clock) begin
		if(~Rst)begin
			address = 7'b0;
			address1=7'b0110010;
		end
		else begin
			case(count)
				10'd0: begin
					address=7'b0001010;
					weight0_0 = weight0;
					address1=7'b0110111;
					weight1_0 = weight1;
					outVal[0] = out0;
					outVal1[0] = out1;
				end
				10'd1: begin
					address = 7'b0010100;
					weight0_1 = weight0;
					address1=7'b0111100;
					weight1_1 = weight1;
					outVal[1] = out0;
					outVal1[1] = out1;
				end
				10'd2: begin
					address = 7'b0011110;
					weight0_2 = weight0;
					address1=7'b0110010;
					weight1_2 = weight1;
					outVal[2] = out0;
					outVal1[2] = out1;
				end
				10'd3: begin
					address = 7'b0101000;
					address1=7'b0001010;
					weight0_3 = weight0;
					outVal[3] = out0;
				end
				10'd4: begin
					address = 7'b0;
					weight0_4 = weight0;
					outVal[4] = out0;
				end
			endcase
		end
	end
	
	assign max = 10'd5;
	
	// Call counter.
	counter counting(Clock, Rst,max, count);
	
	// Call HiddenNueron to get the outVal from HiddenNeuron
	HiddenNeuron hNeuron(inVal, weight0, out0);
	
	// Call OutputNeuron to get the outVal1 from OutputNeuron
	OutputNeuron oNeuron0(outVal, weight1, out1);
	
	//call weight for hidden neuron
	// WeightRAM will give data after one clock cycle 
	// *******************************************************solve here
	WeightRAM	#(10) getWeight0(Clock, In, Rst, weight0, address, WE, weight0);

	//call weight for output neuron
	WeightRAM	#(5) getWeight1(Clock, In, Rst, weight1, address1, WE, weight1);
endmodule 