module HiddenNeuron_tb;
reg [9:0] inVal[0:9];
reg signed [9:0] weight[0:9];
wire [9:0]outVal;

//reg signed [19:0]mulVal[0:9];
//reg signed [23:0]addVal;
initial begin
	inVal[0] = $random;
	inVal[1] = $random;
	inVal[2] = $random;
	inVal[3] = $random;
	inVal[4] = $random;
	inVal[5] = $random;
	inVal[6] = $random;
	inVal[7] = $random;
	inVal[8] = $random;
	inVal[9] = $random;
	
	weight[0] = $random;
	weight[1] = $random;
	weight[2] = $random;
	weight[3] = $random;
	weight[4] = $random;
	weight[5] = $random;
	weight[6] = $random;
	weight[7] = $random;
	weight[8] = $random;
	weight[9] = $random;
	
	#20
	weight[0] = -1;
	weight[1] = -1;
	weight[2] = -1;
	weight[3] = -1;
	weight[4] = -1;
	weight[5] = -1;
	weight[6] = -1;
	weight[7] = -1;
	weight[8] = -1;
	weight[9] = -1;
	
	#20
	weight[0] = 0;
	weight[1] = 0;
	weight[2] = 0;
	weight[3] = 0;
	weight[4] = 0;
	weight[5] = 0;
	weight[6] = -1;
	weight[7] = 0;
	weight[8] = 0;
	weight[9] = 0;
	
end
initial begin
	$display("inVal[0] = %d\ninVal[1] = %d\ninVal[2] = %d\ninVal[3] = %d\ninVal[4] = %d\ninVal[5] = %d\ninVal[6] = %d\ninVal[7] = %d\ninVal[8] = %d\ninVal[9] = %d\n",inVal[0],inVal[1],inVal[2],inVal[3],inVal[4],inVal[5],inVal[6],inVal[7],inVal[8],inVal[9]);
	$display("weight[0] = %d\nweight[1] = %d\nweight[2] = %d\nweight[3] = %d\nweight[4] = %d\nweight[5] = %d\nweight[6] = %d\nweight[7] = %d\nweight[8] = %d\nweight[9] = %d\n",weight[0],weight[1],weight[2],weight[3],weight[4],weight[5],weight[6],weight[7],weight[8],weight[9]);
	//$display("addVal = %d\n",addVal);
	//$display("mulVal[0] = %d\nmulVal[1] = %d\nmulVal[2] = %d\nmulVal[3] = %d\nmulVal[4] = %d\nmulVal[5] = %d\nmulVal[6] = %d\nmulVal[7] = %d\nmulVal[8] = %d\nmulVal[9] = %d\n",mulVal[0],mulVal[1],mulVal[2],mulVal[3],mulVal[4],mulVal[5],mulVal[6],mulVal[7],mulVal[8],mulVal[9]);
	$monitor("outVal = %d\n",outVal);
end

HiddenNeuron HN(inVal,weight,outVal);


endmodule