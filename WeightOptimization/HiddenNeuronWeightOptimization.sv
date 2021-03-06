module HiddenNeuronWeightOptimization(
	input [9:0] delta1[0:2],    //delta1
	input signed[9:0] weight0_0[0:4], //weight from output layer to hidden layer
	input signed[9:0] weight0_1[0:4],
	input signed[9:0] weight0_2[0:4],
	input [9:0] out0_cal[0:4],
	output reg [9:0]delta0[0:4],
	output [0:4]sign0
);

	wire [9:0]out0_err[0:4];
	wire [9:0]out0_exp[0:4];
	reg signed [9:0]mulVal0[0:2];
	reg signed [9:0]mulVal1[0:2];
	reg signed [9:0]mulVal2[0:2];
	reg signed [9:0]mulVal3[0:2];
	reg signed [9:0]mulVal4[0:2];
	reg signed [9:0]addVal[0:4];

	always@(*) begin
	  addVal[0] = mulVal0[0] + mulVal0[1] + mulVal0[2];
	  addVal[1] = mulVal1[0] + mulVal1[1] + mulVal1[2];
	  addVal[2] = mulVal2[0] + mulVal2[1] + mulVal2[2];
	  addVal[3] = mulVal3[0] + mulVal3[1] + mulVal3[2];
	  addVal[4] = mulVal4[0] + mulVal4[1] + mulVal4[2];
	end

	// Multiply input and weight
	// This is the multiply value for first neuron in hidden layer.
	multiply getErr0_0(delta1[0],weight0_0[0],mulVal0[0]);
	multiply getErr0_1(delta1[1],weight0_1[0],mulVal0[1]);
	multiply getErr0_2(delta1[2],weight0_2[0],mulVal0[2]);

	// This is the multiply value for second neuron in hidden layer.
	multiply getErr1_0(delta1[0],weight0_0[1],mulVal1[0]);
	multiply getErr1_1(delta1[1],weight0_1[1],mulVal1[1]);
	multiply getErr1_2(delta1[2],weight0_2[1],mulVal1[2]);

	// This is the multiply value for third neuron in hidden layer.
	multiply getErr2_0(delta1[0],weight0_0[2],mulVal2[0]);
	multiply getErr2_1(delta1[1],weight0_1[2],mulVal2[1]);
	multiply getErr2_2(delta1[2],weight0_2[2],mulVal2[2]);

	// This is the multiply value for fourth neuron in hidden layer.
	multiply getErr3_0(delta1[0],weight0_0[3],mulVal3[0]);
	multiply getErr3_1(delta1[1],weight0_1[3],mulVal3[1]);
	multiply getErr3_2(delta1[2],weight0_2[3],mulVal3[2]);

	// This is the multiply value for fifth neuron in hidden layer.
	multiply getErr4_0(delta1[0],weight0_0[4],mulVal4[0]);
	multiply getErr4_1(delta1[1],weight0_1[4],mulVal4[1]);
	multiply getErr4_2(delta1[2],weight0_2[4],mulVal4[2]);

	// Get the value of out0_exp
	SigmoidPrime getOut0_exp0(out0_cal[0],out0_exp[0]);
	SigmoidPrime getOut0_exp1(out0_cal[1],out0_exp[1]);
	SigmoidPrime getOut0_exp2(out0_cal[2],out0_exp[2]);
	SigmoidPrime getOut0_exp3(out0_cal[3],out0_exp[3]);
	SigmoidPrime getOut0_exp4(out0_cal[4],out0_exp[4]);

	// Get delta0 and sign
	multiplyDelta0 getDelta0(addVal,out0_exp,sign0,delta0);

endmodule 