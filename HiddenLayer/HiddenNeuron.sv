module HiddenNeuron(
	input [9:0] inVal[0:9],
	input signed[9:0] weight[0:9],
	output [9:0]outVal
);

reg signed [9:0]mulVal[0:9];
reg signed [13:0]addVal;

assign addVal = mulVal[0] + mulVal[1] + mulVal[2] + mulVal[3] + mulVal[4] + mulVal[5] + mulVal[6] + mulVal[7] + mulVal[8] + mulVal[9];

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

ActivationFunc callAF(addVal,outVal);
/*********************************************
 * activation function done here,				*
 * the formula is f(X) = 0.5[X/(1+|X|)+1]		*
 *********************************************/

endmodule 