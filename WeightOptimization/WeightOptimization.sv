module WeightOptimization(
	input Clock,Rst,WE,In,
	input [9:0]out1_actual[0:2],  //Actual output on output layer
	input [9:0]out1_cal[0:2],		//Calculated output on output layer
	input [9:0]out_cal[0:4],			//Calculated output on hidden layer
	output [9:0]delta1[0:2]
	);
	//Calculated output was calculated by HiddenLayer module.
	wire [9:0]sig_prime_1[0:2];
	wire [9:0]out1_err[0:2];
	wire [2:0]sign1;
	
	reg	signed[9:0] weight1_0[0:4];
	reg	signed[9:0] weight1_1[0:4];
	reg	signed[9:0] weight1_2[0:4];
	
	Subtraction sub1_0(out1_actual[0],out1_cal[0],out1_err[0],sign1[0]);
	Subtraction sub1_1(out1_actual[1],out1_cal[1],out1_err[1],sign1[1]);
	Subtraction sub1_2(out1_actual[2],out1_cal[2],out1_err[2],sign1[2]);
	
	
	SigmoidPrime sig1_0(out1_cal[0],sig_prime_1[0]);
	SigmoidPrime sig1_1(out1_cal[1],sig_prime_1[1]);
	SigmoidPrime sig1_2(out1_cal[2],sig_prime_1[2]);
	
	//Calculate the value that need to change for weight1
	Delta delta1_0(out1_err[0],sig_prime_1[0],delta1[0]);
	Delta delta1_1(out1_err[1],sig_prime_1[1],delta1[1]);
	Delta delta1_2(out1_err[2],sig_prime_1[2],delta1[2]);
	
	//call weight for output neuron
	WeightRAM	#(5) getWeight1_0(Clock, 1, Rst, weight1_0, 7'b0110010, 0, weight1_0);
	WeightRAM	#(5) getWeight1_1(Clock, 1, Rst, weight1_1, 7'b0110111, 0, weight1_1);
	WeightRAM	#(5) getWeight1_2(Clock, 1, Rst, weight1_2, 7'b0111100, 0, weight1_2);
	
//  WeightUpdate updateWeight1_0(weight1_0,delta1[0]
	
endmodule