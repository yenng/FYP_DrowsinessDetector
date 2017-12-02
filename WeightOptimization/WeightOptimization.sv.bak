module WeightOptimization(
	input Clock,Rst,WE,In,
	input [9:0]out1_actual[0:2],  //Actual output on output layer
	input [9:0]out1_cal[0:2],		//Calculated output on output layer
	input [9:0]out0_cal[0:4],			//Calculated output on hidden layer
	output [9:0]delta1[0:2],
	output [9:0]delta0[0:4]
	);	
	
	//Calculated output was calculated by HiddenLayer module.
	wire [9:0]sig_prime_1[0:2];
	wire [9:0]out1_err[0:2];
	wire [9:0]out0_err[0:4];
	wire [2:0]sign1;
	wire [4:0]sign0;
	
	// Weight for hidden layer
	wire	signed[9:0] weight0_0[0:9];
	wire	signed[9:0] weight0_1[0:9];
	wire	signed[9:0] weight0_2[0:9];
	wire	signed[9:0] weight0_3[0:9];
	wire	signed[9:0] weight0_4[0:9];
	
	wire	signed[9:0] weight0_0_new[0:9];
	wire	signed[9:0] weight0_1_new[0:9];
	wire	signed[9:0] weight0_2_new[0:9];
	wire	signed[9:0] weight0_3_new[0:9];
	wire	signed[9:0] weight0_4_new[0:9];
	
	// Weight for output layer
	wire	signed[9:0] weight1_0[0:4];
	wire	signed[9:0] weight1_1[0:4];
	wire	signed[9:0] weight1_2[0:4];
	
	wire	signed[9:0] weight1_0_new[0:4];
	wire	signed[9:0] weight1_1_new[0:4];
	wire	signed[9:0] weight1_2_new[0:4];
	
	// The following sections are for output layer.
	// *****************************************************************************
	// Get the error between calculated output and actual output.
	Subtraction sub1_0(out1_actual[0],out1_cal[0],out1_err[0],sign1[0]);
	Subtraction sub1_1(out1_actual[1],out1_cal[1],out1_err[1],sign1[1]);
	Subtraction sub1_2(out1_actual[2],out1_cal[2],out1_err[2],sign1[2]);
	
	SigmoidPrime sig1_0(out1_cal[0],sig_prime_1[0]);
	SigmoidPrime sig1_1(out1_cal[1],sig_prime_1[1]);
	SigmoidPrime sig1_2(out1_cal[2],sig_prime_1[2]);
	
	// Calculate the value that need to change for weight1
	Delta delta1_0(out1_err[0],sig_prime_1[0],delta1[0]);
	Delta delta1_1(out1_err[1],sig_prime_1[1],delta1[1]);
	Delta delta1_2(out1_err[2],sig_prime_1[2],delta1[2]);
	
	// Call weight1 for output neuron
	WeightRAM	#(5) getWeight1_0(Clock, In, Rst, weight1_0_new, 7'b0110010, WE, weight1_0);
	WeightRAM	#(5) getWeight1_1(Clock, In, Rst, weight1_1_new, 7'b0110111, WE, weight1_1);
	WeightRAM	#(5) getWeight1_2(Clock, In, Rst, weight1_2_new, 7'b0111100, WE, weight1_2);
	
	// Update weight1
	WeightUpdate #(5) updateWeight1_0(weight1_0,delta1[0],sign1[0],weight1_0_new);
	WeightUpdate #(5) updateWeight1_1(weight1_1,delta1[0],sign1[0],weight1_1_new);
	WeightUpdate #(5) updateWeight1_2(weight1_2,delta1[0],sign1[0],weight1_2_new);
  
  // ********************************************************************************
  // The following sections are for hidden layer.
  // Read the weight of hidden layer to output layer wjich is weight0
	WeightRAM	#(10) getWeight0_0(Clock, In, Rst, weight0_0_new, 7'b0000000, WE, weight0_0);
	WeightRAM	#(10) getWeight0_1(Clock, In, Rst, weight0_1_new, 7'b0001010, WE, weight0_1);
	WeightRAM	#(10) getWeight0_2(Clock, In, Rst, weight0_2_new, 7'b0010100, WE, weight0_2);
	WeightRAM	#(10) getWeight0_3(Clock, In, Rst, weight0_3_new, 7'b0011110, WE, weight0_3);
	WeightRAM	#(10) getWeight0_4(Clock, In, Rst, weight0_4_new, 7'b0101000, WE, weight0_4);
  
  // Get the sum of production of delta1 and weight0 for each hidden neuron.
  HiddenNeuronWeightOptimization getErr0_0(delta1,weight0_0,weight0_1,weight0_2,out0_cal,delta0,sign0);  
	
endmodule