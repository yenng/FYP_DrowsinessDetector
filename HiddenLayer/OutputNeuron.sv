module OutputNeuron(
	input inVal[0:4],
	input signed[9:0] weight[0:4],
	output outVal);
	
reg signed[9:0]mulVal[0:4];
reg signed[23:0]addVal;

assign addVal = mulVal[0] + mulVal[1] + mulVal[2]+ mulVal[3]+ mulVal[4];

//multiply input and weight
multiply mul0(inVal[0],weight[0],mulVal[0]);
multiply mul1(inVal[1],weight[1],mulVal[1]);
multiply mul2(inVal[2],weight[2],mulVal[2]);
multiply mul3(inVal[2],weight[3],mulVal[3]);
multiply mul4(inVal[2],weight[4],mulVal[4]);

ActivationFunc callAF(addVal,outVal);

endmodule