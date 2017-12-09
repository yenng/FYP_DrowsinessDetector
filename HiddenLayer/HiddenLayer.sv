 module HiddenLayer(
	input		Clock,Rst,WE,In,
	input		[9:0] inVal[0:9],
	output reg [9:0]outVal[0:4],
	output reg [9:0]outVal1[0:2],
	output reg [3:0]state,
	output reg [6:0]address
	);
	
	reg [6:0]address1;
	
	reg [9:0]max,count;
	reg [3:0]nextstate;
	
	// Universal out
	wire [9:0]out0;
	wire [9:0]out1;
	
	// Universal weight
	reg	signed[9:0] weight0[0:9];   
	reg	signed[9:0] weight1[0:4];
	
	always@(posedge Clock, negedge Rst) begin
		if(~Rst) begin
			state = 4'd0;
		end
		else
		  state = nextstate;
	end
	
	always@(state) begin
	  case(state)
	    4'd0: begin
	      address = 7'b0;
		    address1 = 7'b0110010;
	      nextstate = 4'd1;
	    end
	    4'd1: begin
	      outVal[0] = out0;
	      outVal1[0] = out1;
	      nextstate = 4'd2;
	    end
	    4'd2: begin
	      address = 7'b0001010;
		    address1 = 7'b0110111;
	      nextstate = 4'd3;
	    end
	    4'd3: begin
	      outVal[1] = out0;
	      outVal1[1] = out1;
	      nextstate = 4'd4;
	    end
	    4'd4: begin
	      address = 7'b0010100;
	      address1 = 7'b0111100;
	      nextstate = 4'd5;
	    end
	    4'd5: begin
	      outVal[2] = out0;
	      outVal1[2] = out1;
	      nextstate = 4'd6;
	    end
	    4'd6: begin
	      address = 7'b0011110;
	      nextstate = 4'd7;
	    end
	    4'd7: begin
        outVal[3] = out0;
        nextstate = 4'd8;
      end
      4'd8: begin
        address = 7'b0101000;
        nextstate = 4'd9;
      end
      4'd9: begin
        outVal[4] = out0;
        nextstate = 4'd0;
      end
	  endcase
	end
	
	// Call HiddenNueron to get the outVal from HiddenNeuron
	HiddenNeuron hNeuron(inVal, weight0, out0);
	
	// Call OutputNeuron to get the outVal1 from OutputNeuron
	OutputNeuron oNeuron0(outVal, weight1, out1);
	
	//call weight for hidden neuron
	WeightRAM	#(10) getWeight0(Clock, In, Rst, weight0, address, WE, weight0);

	//call weight for output neuron
	WeightRAM	#(5) getWeight1(Clock, In, Rst, weight1, address1, WE, weight1);
endmodule 