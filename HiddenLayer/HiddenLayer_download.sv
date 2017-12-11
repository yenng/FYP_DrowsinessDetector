module HiddenLayer_download(
	input CLOCK_50,
	input [17:0]SW,
	input [3:0]KEY,
	output [17:0]LEDR,
	output [7:0]LEDG,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
	
	wire [9:0]outVal[0:4];
	wire [9:0]outVal1[0:2];
	wire [3:0]state;
	wire [6:0]address;
	
	reg [9:0] inVal[0:9];
	reg [9:0] inVal_t;
	
	reg [3:0] outVal_t[2:0];
	
	always@(posedge CLOCK_50) begin
		if(SW[2])begin //write SW[17:8] to inVal
			if(SW[3])	//
				inVal_t = SW[17:8];
			else
				inVal[SW[7:4]] = inVal_t;
		end
		else begin //read data from outVal and outVal1
			if(SW[3]) begin	//read outVal
				outVal_t[0] = outVal[SW[7:4]][3:0];
				outVal_t[1] = outVal[SW[7:4]][7:4];
				outVal_t[2] = outVal[SW[7:4]][9:8];
			end
		end
		
	end
	
	_7SegmentDisplay out0(outVal_t[0],HEX0);
	_7SegmentDisplay out1(outVal_t[1],HEX1);
	_7SegmentDisplay out2(outVal_t[2],HEX2);
	_7SegmentDisplay stateShow(state,HEX7);
	
	HiddenLayer download(
					.Clock(KEY[3]),
					.Rst(KEY[0]),
					.WE(SW[1]),
					.In(SW[0]),
					.inVal(inVal),
					.outVal(outVal),
					.outVal1(outVal1),
					.state(state),
					.address(address));
	endmodule