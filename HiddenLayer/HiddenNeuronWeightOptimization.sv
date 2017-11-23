module HiddenNeuronWeightOptimization(
	input [9:0] delta1[0:2],    //delta1
	input signed[9:0] weight0_0[0:4], //weight from output layer to hidden layer
	input signed[9:0] weight0_1[0:4],
	input signed[9:0] weight0_2[0:4],
	output [9:0]outErr[0:4]
);

reg signed [19:0]mulVal[0:9];
reg signed [23:0]addVal_t;
reg signed [9:0]addVal;
reg [9:0]addVal_abs;

assign addVal_t = mulVal[0] + mulVal[1] + mulVal[2] + mulVal[3] + mulVal[4] + mulVal[5] + mulVal[6] + mulVal[7] + mulVal[8] + mulVal[9];
assign addVal = addVal_t/1000;

//multiply input and weight
multiply mul0(inVal[0],weight[0],mulVal[0]);
multiply mul1(inVal[1],weight[1],mulVal[1]);
multiply mul2(inVal[2],weight[2],mulVal[2]);
multiply mul3(inVal[3],weight[3],mulVal[3]);
multiply mul4(inVal[4],weight[4],mulVal[4]);
multiply mul5(inVal[5],weight[5],mulVal[5]);
multiply mul6(inVal[6],weight[6],mulVal[6]);
multiply mul7(inVal[7],weight[7],mulVal[7]);
multiply mul8(inVal[8],weight[8],mulVal[8]);
multiply mul9(inVal[9],weight[9],mulVal[9]);

SigmoidPrime callAF(addVal,outVal);
/*********************************************
 * activation function done here,				*
 * the formula is f(X) = 0.5[X/(1+|X|)+1]		*
 *********************************************/

endmodule 