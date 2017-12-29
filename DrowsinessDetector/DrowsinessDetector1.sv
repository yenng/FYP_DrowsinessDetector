module DrowsinessDetector1(
  input Clock, Rst, Start, training,
  input [9:0] in1 [29:0],
	input [9:0] out_ann_real[2:0],
	output reg [9:0] out_ann[2:0],
	output reg [9:0] out_hid[4:0],
	output reg done
);

reg [4:0] nextState, state;

reg [9:0]weight_hid [149:0];
reg [9:0]weight_out [14:0];

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
reg [9:0] count,data,count0,count2;
reg [7:0] Address;
reg on;

wire [9:0]out1_err[2:0];
wire [2:0]sign1;
wire [9:0]sig_prime_1[2:0];
reg [9:0]delta1[2:0];

integer i;

parameter 	halt = 0, weightInitiallize = 1, multiply_hid = 2, storeMul = 3, hiddenLayer = 4,
           hiddenOut = 5, multiply_ann = 6, storeMulAnn = 7, outputLayer = 8, AnnOut = 9,
           weightOptimization = 10, getDelta = 11, stopTraining = 12, stop = 31;
           
always@(posedge Clock or negedge Rst) begin
  if(~Rst) begin
    state <= halt;
  end
  else begin
    state <= nextState;
    count0 = count;
  end
end

always@(state,data,mulVal0) begin
  case(state)
    halt:begin
      on = 1;
      count = 0;
      count2 = 0;
      done = 1;
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
      if (count > 149) begin
        if(count > 165) begin
          count = 0;
          nextState = multiply_hid;
        end  
        else begin
          weight_out[count-150] = data;
          count++;
        end 
      end
      else begin
        weight_hid[count] = data;
        count++;
      end
    end
    
    // The state below is for hiddenLayer block (block 2)
    // Hidden Layer
    // This state multiply input value with weight 
    multiply_hid: begin
      if (count >29) begin
        count = 0;
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
      count++;
      nextState = multiply_hid;
    end
    
    // This state add all the multiplication value and ready the add value for activation function.
    hiddenLayer:begin
      if(count > 29) begin
        count = 0;
        af_in[0] = addVal_hid[0];
        af_in[1] = addVal_hid[1];
        af_in[2] = addVal_hid[2];
        af_in[3] = addVal_hid[3];
        af_in[4] = addVal_hid[4];
        nextState = hiddenOut;
        end
      else begin
        addVal_hid[0] = addVal_hid[0] + mulVal_hid[0][count];
        addVal_hid[1] = addVal_hid[1] + mulVal_hid[1][count];
        addVal_hid[2] = addVal_hid[2] + mulVal_hid[2][count];
        addVal_hid[3] = addVal_hid[3] + mulVal_hid[3][count];
        addVal_hid[4] = addVal_hid[4] + mulVal_hid[4][count];
        count++;
      end
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
      if (count >4) begin
        count = 0;
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
      count++;
      nextState = multiply_ann;
    end
    
    // Add all the multiplication data and ready the input for activation function.
    outputLayer:begin
      if(count > 4) begin
        count = 0;
        af_in1[0] = addVal_out[0];
        af_in1[1] = addVal_out[1];
        af_in1[2] = addVal_out[2];
        nextState = AnnOut;
        end
      else begin
        addVal_out[0] = addVal_out[0] + mulVal_out[0][count];
        addVal_out[1] = addVal_out[1] + mulVal_out[1][count];
        addVal_out[2] = addVal_out[2] + mulVal_out[2][count];
        count++;
      end
    end
    
    // Get the output data from output layer.
    AnnOut: begin
      out_ann[0] = af_out1[0];
      out_ann[1] = af_out1[1];
      out_ann[2] = af_out1[2];
      done = 1;
      nextState = getDelta;
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
      if(count>4)begin
        count = 0;
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
        count++;
      end
    end
    stopTraining: begin
      if(delta1[0] < 5 && delta1[1] < 5 && delta1[2] < 5)
        nextState = stop;
      else
        nextState = multiply_hid;
    end
  endcase
end
LFSR rndnm(Clock, Rst, on, data);

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
Subtraction sub1_0(out_ann_real[0],out_ann[0],out1_err[0],sign1[0]);
Subtraction sub1_1(out_ann_real[1],out_ann[1],out1_err[1],sign1[1]);
Subtraction sub1_2(out_ann_real[2],out_ann[2],out1_err[2],sign1[2]);

SigmoidPrime sig1_0(out_ann[0],sig_prime_1[0]);
SigmoidPrime sig1_1(out_ann[1],sig_prime_1[1]);
SigmoidPrime sig1_2(out_ann[2],sig_prime_1[2]);
endmodule