module HiddenLayer(
	input		Clock,Rst,WE,In,
	input		[9:0] inVal[0:9],
	//output	[2:0]out,
	output	signed[9:0]outVal[0:4]
	);
	/*
	reg	[6:0] Address0;
	reg	[6:0] Address1;
	reg	[6:0] Address2;
	reg	[6:0] Address3;
	reg	[6:0] Address4;
	reg	[6:0] Address5;
	reg	[6:0] Address6;
	reg	[6:0] Address7;
	*/
	reg	[9:0] weight0_0[0:9];
	reg	[9:0] weight0_1[0:9];
	reg	[9:0] weight0_2[0:9];
	reg	[9:0] weight0_3[0:9];
	reg	[9:0] weight0_4[0:9];
	
	reg	[9:0] D[0:9];
	
	reg	[9:0] weight1_0[0:4];
	reg	[9:0] weight1_1[0:4];
	reg	[9:0] weight1_2[0:4];
	
	reg	[9:0] D1[0:4];
	
	reg	[19:0]mulVal[0:14];
	reg	[23:0]addVal[0:4];
	
	/*
	assign Address0 = 7'b0000000;
	assign Address1 = 7'b0001010;
	assign Address2 = 7'b0010100;
	assign Address3 = 7'b0011110;
	assign Address4 = 7'b0101000;
	*/
	
	HiddenNeuron neuron0(inVal, weight0_0, outVal[0]);
	HiddenNeuron neuron1(inVal, weight0_1, outVal[1]);
	HiddenNeuron neuron2(inVal, weight0_2, outVal[2]);
	HiddenNeuron neuron3(inVal, weight0_3, outVal[3]);
	HiddenNeuron neuron4(inVal, weight0_4, outVal[4]);

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
	
	/*
	//call weight for hidden neuron
	WeightRAM	#(10) getWeight0_0(Clock, Rst, 1'b0, weight0_0, 7'b0000000, WE, weight0_0);
	WeightRAM	#(10) getWeight0_1(Clock, Rst, 1'b0, weight0_1, 7'b0001010, WE, weight0_1);
	WeightRAM	#(10) getWeight0_2(Clock, Rst, 1'b0, weight0_2, 7'b0010100, WE, weight0_2);
	WeightRAM	#(10) getWeight0_3(Clock, Rst, 1'b0, weight0_3, 7'b0011110, WE, weight0_3);
	WeightRAM	#(10) getWeight0_4(Clock, Rst, 1'b0, weight0_4, 7'b0101000, WE, weight0_4);

	//call weight for output neuron
	WeightRAM	#(5) getWeight1_0(Clock, Rst, 1'b0, weight1_0, 7'b0110010, WE, weight1_0);
	WeightRAM	#(5) getWeight1_1(Clock, Rst, 1'b0, weight1_1, 7'b0110111, WE, weight1_1);
	WeightRAM	#(5) getWeight1_2(Clock, Rst, 1'b0, weight1_2, 7'b0111100, WE, weight1_2);
	*/
endmodule 