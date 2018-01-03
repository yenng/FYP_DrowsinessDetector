module DrowsinessDetector1(
  input Clock, Rst, Start, train,
  input clock1sec,
  input [9:0] in1 [29:0],
	input [9:0] out_ann_real[2:0],
	output reg [9:0] out_ann[2:0],
	output reg [9:0] out_hid[4:0],
	output reg done, doneTraining,
	output reg [4:0] state,
	output reg [9:0]weight_out [14:0]
);

reg [9:0] out_ann_t[2:0];
reg [4:0] nextState;
//reg train;
reg startCount,Clock_slow;
wire stopCount;
reg [9:0] max;
reg [9:0] count;

reg [9:0]weight_hid [149:0];
//reg [9:0]weight_out [14:0];

reg [9:0] weight0,mulVal0,inVal,inVal1;
reg [9:0] weight1,mulVal1;
reg [9:0] weight2,mulVal2;
reg [9:0] weight3,mulVal3;
reg [9:0] weight4,mulVal4;
reg [9:0] weight5,mulVal5;
reg [9:0] weight6,mulVal6;
reg [9:0] weight7,mulVal7;
reg [9:0] af_in [4:0];
reg [9:0] af_out [4:0];
reg [9:0] af_in1 [2:0];
reg [9:0] af_out1 [2:0];

reg [9:0] addVal_hid[4:0];
reg [9:0] mulVal_hid[4:0][29:0];

reg [9:0] addVal_out[2:0];
reg [9:0] mulVal_out[2:0][4:0];
reg [9:0] data,count0;
reg on, go;

wire [9:0]out1_err[2:0];
wire [2:0]sign1;
wire [9:0]sig_prime_1[2:0];
reg [9:0]delta1[2:0];
reg doneInitiallize;
integer i;

parameter 	halt = 0, weightInitiallize = 1, multiply_hid = 2, storeMul = 3, hiddenLayer = 4,
           hiddenOut = 5, multiply_ann = 6, storeMulAnn = 7, outputLayer = 8, AnnOut = 9,
           weightOptimization = 10, getDelta = 11, stopTraining = 12, waitState = 13, stop = 31;
           
always@(posedge Clock or negedge Rst) begin
	if(~Rst) begin
		state <= halt;
	end
	else begin
		if(~train) begin
			if(clock1sec)
				state <= waitState;
			else
				state <= nextState;
		end
		else
			state <= nextState;
	end
end

always@(negedge Clock) begin
  case(state)
    halt:begin
      on = 1;
      done = 0;
		doneTraining = 0;
		doneInitiallize = 0;
		startCount = 0;
      doneTraining = 0;
      addVal_hid[0] = 0;
      addVal_hid[1] = 0;
      addVal_hid[2] = 0;
      addVal_hid[3] = 0;
      addVal_hid[4] = 0;
      addVal_out[0] = 0;
      addVal_out[1] = 0;
      addVal_out[2] = 0;
      nextState = weightInitiallize;
    end
    weightInitiallize: begin
		  startCount = 1;
		  max = 165;
      if(stopCount) begin
			doneInitiallize = 1;
			if(Start)
				nextState = weightInitiallize;
			else
				nextState = waitState;
        end 
      else begin
        if (count > 149) begin
          weight_out[count-150] = data;
			 nextState = weightInitiallize;
        end
        else begin
          weight_hid[count] = data;
		    nextState = weightInitiallize;
        end
      end
    end
	 waitState:begin
      done = 0;
		startCount = 0;
      addVal_hid[0] = 0;
      addVal_hid[1] = 0;
      addVal_hid[2] = 0;
      addVal_hid[3] = 0;
      addVal_hid[4] = 0;
      addVal_out[0] = 0;
      addVal_out[1] = 0;
      addVal_out[2] = 0;
		nextState = multiply_hid;
	 end
    
    // The state below is for hiddenLayer block (block 2)
    // Hidden Layer
    // This state multiply input value with weight 
    multiply_hid: begin
		startCount = 1;
		max = 30;
      done = 0;
      if (stopCount) begin
			startCount = 0;
			nextState = hiddenLayer;
      end
      else begin
        weight0 = weight_hid[count];
        weight1 = weight_hid[count+30];
        weight2 = weight_hid[count+60];
        weight3 = weight_hid[count+90];
        weight4 = weight_hid[count+120];
        inVal = in1[count];
        nextState = storeMul;
      end
    end
    
    // This state store the value after multiplication
    storeMul: begin
      mulVal_hid[0][count] = mulVal0;
      mulVal_hid[1][count] = mulVal1;
      mulVal_hid[2][count] = mulVal2;
      mulVal_hid[3][count] = mulVal3;
      mulVal_hid[4][count] = mulVal4;
      nextState = multiply_hid;
    end
    
    // This state add all the multiplication value and ready the add value for activation function.
    hiddenLayer:begin
        af_in[0] = mulVal_hid[0][0]+mulVal_hid[0][1]+mulVal_hid[0][2]+mulVal_hid[0][3]+mulVal_hid[0][4]
						+mulVal_hid[0][5]+mulVal_hid[0][6]+mulVal_hid[0][7]+mulVal_hid[0][8]+mulVal_hid[0][9]
						+mulVal_hid[0][10]+mulVal_hid[0][11]+mulVal_hid[0][12]+mulVal_hid[0][13]+mulVal_hid[0][14]
						+mulVal_hid[0][15]+mulVal_hid[0][16]+mulVal_hid[0][17]+mulVal_hid[0][18]+mulVal_hid[0][19]
						+mulVal_hid[0][20]+mulVal_hid[0][21]+mulVal_hid[0][22]+mulVal_hid[0][23]+mulVal_hid[0][24]
						+mulVal_hid[0][25]+mulVal_hid[0][26]+mulVal_hid[0][27]+mulVal_hid[0][28]+mulVal_hid[0][29];
        af_in[1] =mulVal_hid[1][0]+mulVal_hid[1][1]+mulVal_hid[1][2]+mulVal_hid[1][3]+mulVal_hid[1][4]
						+mulVal_hid[1][5]+mulVal_hid[1][6]+mulVal_hid[1][7]+mulVal_hid[1][8]+mulVal_hid[1][9]
						+mulVal_hid[1][10]+mulVal_hid[1][11]+mulVal_hid[1][12]+mulVal_hid[1][13]+mulVal_hid[1][14]
						+mulVal_hid[1][15]+mulVal_hid[1][16]+mulVal_hid[1][17]+mulVal_hid[1][18]+mulVal_hid[1][19]
						+mulVal_hid[1][20]+mulVal_hid[1][21]+mulVal_hid[1][22]+mulVal_hid[1][23]+mulVal_hid[1][24]
						+mulVal_hid[1][25]+mulVal_hid[1][26]+mulVal_hid[1][27]+mulVal_hid[1][28]+mulVal_hid[1][29];
        af_in[2] = mulVal_hid[2][0]+mulVal_hid[2][1]+mulVal_hid[2][2]+mulVal_hid[2][3]+mulVal_hid[2][4]
						+mulVal_hid[2][5]+mulVal_hid[2][6]+mulVal_hid[2][7]+mulVal_hid[2][8]+mulVal_hid[2][9]
						+mulVal_hid[2][10]+mulVal_hid[2][11]+mulVal_hid[2][12]+mulVal_hid[2][13]+mulVal_hid[2][14]
						+mulVal_hid[2][15]+mulVal_hid[2][16]+mulVal_hid[2][17]+mulVal_hid[2][18]+mulVal_hid[2][19]
						+mulVal_hid[2][20]+mulVal_hid[2][21]+mulVal_hid[2][22]+mulVal_hid[2][23]+mulVal_hid[2][24]
						+mulVal_hid[2][25]+mulVal_hid[2][26]+mulVal_hid[2][27]+mulVal_hid[2][28]+mulVal_hid[2][29];
        af_in[3] = mulVal_hid[3][0]+mulVal_hid[3][1]+mulVal_hid[3][2]+mulVal_hid[3][3]+mulVal_hid[3][4]
						+mulVal_hid[3][5]+mulVal_hid[3][6]+mulVal_hid[3][7]+mulVal_hid[3][8]+mulVal_hid[3][9]
						+mulVal_hid[3][10]+mulVal_hid[3][11]+mulVal_hid[3][12]+mulVal_hid[3][13]+mulVal_hid[3][14]
						+mulVal_hid[3][15]+mulVal_hid[3][16]+mulVal_hid[3][17]+mulVal_hid[3][18]+mulVal_hid[3][19]
						+mulVal_hid[3][20]+mulVal_hid[3][21]+mulVal_hid[3][22]+mulVal_hid[3][23]+mulVal_hid[3][24]
						+mulVal_hid[3][25]+mulVal_hid[3][26]+mulVal_hid[3][27]+mulVal_hid[3][28]+mulVal_hid[3][29];
        af_in[4] = mulVal_hid[4][0]+mulVal_hid[4][1]+mulVal_hid[4][2]+mulVal_hid[4][3]+mulVal_hid[4][4]
						+mulVal_hid[4][5]+mulVal_hid[4][6]+mulVal_hid[4][7]+mulVal_hid[4][8]+mulVal_hid[4][9]
						+mulVal_hid[4][10]+mulVal_hid[4][11]+mulVal_hid[4][12]+mulVal_hid[4][13]+mulVal_hid[4][14]
						+mulVal_hid[4][15]+mulVal_hid[4][16]+mulVal_hid[4][17]+mulVal_hid[4][18]+mulVal_hid[4][19]
						+mulVal_hid[4][20]+mulVal_hid[4][21]+mulVal_hid[4][22]+mulVal_hid[4][23]+mulVal_hid[4][24]
						+mulVal_hid[4][25]+mulVal_hid[4][26]+mulVal_hid[4][27]+mulVal_hid[4][28]+mulVal_hid[4][29];
        nextState = hiddenOut;
    end
    
    // Get the output value of hidden layer from activation function.
    hiddenOut: begin
      out_hid[0] = af_out[0];
      out_hid[1] = af_out[1];
      out_hid[2] = af_out[2];
      out_hid[3] = af_out[3];
      out_hid[4] = af_out[4];
      nextState = multiply_ann;
    end
    
    // Output Layer
    // Multiply weight with output of hidden layer.
    multiply_ann: begin
		startCount = 1;
		max = 5;
      if (stopCount) begin
        startCount = 0;
        nextState = outputLayer;
      end
      else begin
        weight5 = weight_out[count];
        weight6 = weight_out[count+5];
        weight7 = weight_out[count+10];
        inVal1 = out_hid[count];
        nextState = storeMulAnn;
      end
    end
    
    // Store the multiplication data.
    storeMulAnn: begin
      mulVal_out[0][count] = mulVal5;
      mulVal_out[1][count] = mulVal6;
      mulVal_out[2][count] = mulVal7;
      nextState = multiply_ann;
    end
    
    // Add all the multiplication data and ready the input for activation function.
    outputLayer:begin
		af_in1[0] = mulVal_out[0][0]+mulVal_out[0][1]+mulVal_out[0][2]+mulVal_out[0][3]+mulVal_out[0][4];
		af_in1[1] = mulVal_out[1][0]+mulVal_out[1][1]+mulVal_out[1][2]+mulVal_out[1][3]+mulVal_out[1][4];
		af_in1[2] = mulVal_out[2][0]+mulVal_out[2][1]+mulVal_out[2][2]+mulVal_out[2][3]+mulVal_out[2][4];
		nextState = AnnOut;
    end
    
    // Get the output data from output layer.
	AnnOut: begin
      done = 1;
		startCount = 0;
		out_ann_t[0] = af_out1[0];
		out_ann_t[1] = af_out1[1];
		out_ann_t[2] = af_out1[2];
		if(train) 
			nextState = getDelta;
		else
			nextState = AnnOut;//*********************************************************************************************************
    end
    // The following state is for weightOptimization block (block 3).
    // Get the error by substracting real output and calculated output.
    getDelta:begin
      delta1[0] = out1_err[0] * sig_prime_1[0] / 1000;
      delta1[1] = out1_err[1] * sig_prime_1[1] / 1000;
      delta1[2] = out1_err[2] * sig_prime_1[2] / 1000;
      nextState = weightOptimization;
    end
    weightOptimization: begin
		startCount = 1;
		max = 5;
      if(stopCount)begin
        startCount = 0;
        addVal_hid[0] = 0;
        addVal_hid[1] = 0;
        addVal_hid[2] = 0;
        addVal_hid[3] = 0;
        addVal_hid[4] = 0;
        addVal_out[0] = 0;
        addVal_out[1] = 0;
        addVal_out[2] = 0;
        nextState = stopTraining;
      end
      else begin
        if(sign1[0])
          weight_out[count] = weight_out[count]-delta1[0];
        else
          weight_out[count] = weight_out[count]+delta1[0];
        if(sign1[1])
          weight_out[count+5] = weight_out[count+5]-delta1[1];
        else
          weight_out[count+5] = weight_out[count+5]+delta1[1];
        if(sign1[2])
          weight_out[count+10] = weight_out[count+10]-delta1[2];
        else
          weight_out[count+10] = weight_out[count+10]+delta1[2];
        nextState = weightOptimization;
      end
    end
    stopTraining: begin
      if(delta1[0] < 5 && delta1[1] < 5 && delta1[2] < 5) begin
        nextState = stop;
        doneTraining = 1;
      end
      else
        nextState = multiply_hid;
    end
	 stop:begin
		if(~train)
			nextState = AnnOut;
	 end
	 default: 
		nextState = waitState;
  endcase
end

dff_ann getOutAnn(out_ann_t, clock1sec,Rst,out_ann);


LFSR rndnm(Clock_slow, Rst, on, data);
clk_div slow(Clock,Rst,Clock_slow);
counter c1(Clock_slow,startCount,max,stopCount,count);

multiply mul_hid0(inVal,weight0,mulVal0);
multiply mul_hid1(inVal,weight1,mulVal1);
multiply mul_hid2(inVal,weight2,mulVal2);
multiply mul_hid3(inVal,weight3,mulVal3);
multiply mul_hid4(inVal,weight4,mulVal4);

multiply mul_out0(inVal1,weight5,mulVal5);
multiply mul_out1(inVal1,weight6,mulVal6);
multiply mul_out2(inVal1,weight7,mulVal7);

ActivationFunc AF_hid0(af_in[0],af_out[0]);
ActivationFunc AF_hid1(af_in[1],af_out[1]);
ActivationFunc AF_hid2(af_in[2],af_out[2]);
ActivationFunc AF_hid3(af_in[3],af_out[3]);
ActivationFunc AF_hid4(af_in[4],af_out[4]);

ActivationFunc AF_out0(af_in1[0],af_out1[0]);
ActivationFunc AF_out1(af_in1[1],af_out1[1]);
ActivationFunc AF_out2(af_in1[2],af_out1[2]);

// Get the error between calculated output and actual output.
Subtraction sub1_0(out_ann_real[0],out_ann_t[0],out1_err[0],sign1[0]);
Subtraction sub1_1(out_ann_real[1],out_ann_t[1],out1_err[1],sign1[1]);
Subtraction sub1_2(out_ann_real[2],out_ann_t[2],out1_err[2],sign1[2]);

SigmoidPrime sig1_0(out_ann_t[0],sig_prime_1[0]);
SigmoidPrime sig1_1(out_ann_t[1],sig_prime_1[1]);
SigmoidPrime sig1_2(out_ann_t[2],sig_prime_1[2]);
endmodule