module HiddenNeuronWeightOptimization_tb;
  
reg [9:0] delta1[0:2];
reg signed[9:0] weight0_0[0:4];
reg signed[9:0] weight0_1[0:4];
reg signed[9:0] weight0_2[0:4];
reg [9:0] out0_cal[0:4];
wire signed[9:0]delta0[0:4];

HiddenNeuronWeightOptimization test(delta1,weight0_0,weight0_1,weight0_2,out0_cal,delta0);

initial begin
	weight0_0[0] = 10'b1101011100;
	weight0_0[1] = 10'b1001011100;
	weight0_0[2] = 10'b1001011110;
	weight0_0[3] = 10'b1101000100;
	weight0_0[4] = 10'b1001001000;
	
	weight0_1[0] = 10'b1101011100;
	weight0_1[1] = 10'b1001011100;
	weight0_1[2] = 10'b1001011110;
	weight0_1[3] = 10'b1101000100;
	weight0_1[4] = 10'b1001001000;
	
	weight0_2[0] = 10'b1101111000;
	weight0_2[1] = 10'b0001011101;
	weight0_2[2] = 10'b1011010110;
	weight0_2[3] = 10'b0101000101;
	weight0_2[4] = 10'b1001101000;
	
	delta1[0] = 10'b0001110010;
	delta1[1] = 10'b0101110010;
	delta1[2] = 10'b0001010010;
	
	out0_cal[0] = 10'b0000000001;
	out0_cal[1] = 10'b0000000001;
	out0_cal[2] = 10'b0000000001;
	out0_cal[3] = 10'b0000000001;
	out0_cal[4] = 10'b0000000001;
end

initial begin
  $monitor("Delta0 = \n%p\n%p\n%p\n%p\n%p", delta0[0],delta0[1],delta0[2],delta0[3],delta0[4]);
end
endmodule