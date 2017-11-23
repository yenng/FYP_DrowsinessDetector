module HiddenLayer(
	input		Clock,Rst,WE,In,
	input		[9:0] inVal[0:9],
	output [9:0]outVal[0:4],
	output [9:0]outVal1[0:2],
	output signed[9:0] weight[0:64]
	);
	
	reg	signed[9:0] weight0_0[0:9];
	reg	signed[9:0] weight0_1[0:9];
	reg	signed[9:0] weight0_2[0:9];
	reg	signed[9:0] weight0_3[0:9];
	reg	signed[9:0] weight0_4[0:9];
	
	reg	signed[9:0] weight1_0[0:4];
	reg	signed[9:0] weight1_1[0:4];
	reg	signed[9:0] weight1_2[0:4];
	
	reg	[19:0]mulVal[0:14];
	reg	[23:0]addVal[0:4];
	
	// Call HiddenNueron to get the outVal from HiddenNueron
	HiddenNeuron hNeuron0(inVal, weight0_0, outVal[0]);
	HiddenNeuron hNeuron1(inVal, weight0_1, outVal[1]);
	HiddenNeuron hNeuron2(inVal, weight0_2, outVal[2]);
	HiddenNeuron hNeuron3(inVal, weight0_3, outVal[3]);
	HiddenNeuron hNeuron4(inVal, weight0_4, outVal[4]);
	
	OutputNeuron oNeuron0(outVal, weight1_0, outVal1[0]);
	OutputNeuron oNeuron1(outVal, weight1_1, outVal1[1]);
	OutputNeuron oNeuron2(outVal, weight1_2, outVal1[2]);
	
	//call weight for hidden neuron
	WeightRAM	#(10) getWeight0_0(Clock, In, Rst, weight0_0, 7'b0000000, WE, weight0_0);
	WeightRAM	#(10) getWeight0_1(Clock, In, Rst, weight0_1, 7'b0001010, WE, weight0_1);
	WeightRAM	#(10) getWeight0_2(Clock, In, Rst, weight0_2, 7'b0010100, WE, weight0_2);
	WeightRAM	#(10) getWeight0_3(Clock, In, Rst, weight0_3, 7'b0011110, WE, weight0_3);
	WeightRAM	#(10) getWeight0_4(Clock, In, Rst, weight0_4, 7'b0101000, WE, weight0_4);

	//call weight for output neuron
	WeightRAM	#(5) getWeight1_0(Clock, In, Rst, weight1_0, 7'b0110010, WE, weight1_0);
	WeightRAM	#(5) getWeight1_1(Clock, In, Rst, weight1_1, 7'b0110111, WE, weight1_1);
	WeightRAM	#(5) getWeight1_2(Clock, In, Rst, weight1_2, 7'b0111100, WE, weight1_2);
	
	assign weight[0:9] = weight0_0;
	assign weight[10:19] = weight0_1;
	assign weight[20:29] = weight0_2;
	assign weight[30:39] = weight0_3;
	assign weight[40:49] = weight0_4;
	assign weight[50:54] = weight1_0;
	assign weight[55:59] = weight1_1;
	assign weight[60:64] = weight1_2;
	
	
endmodule 