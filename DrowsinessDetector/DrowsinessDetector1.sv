module DrowsinessDetector1(
  input Clock, Rst, Start, training,
  input [9:0] in1 [29:0],
	input [9:0] out_ann_real[2:0],
	output reg [9:0] out_ann[2:0],
	output reg [9:0] out_hid[4:0]  
);

reg [3:0] nextState, state;

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

integer i;

parameter 	halt = 0, weightInitiallize = 1, multiply_hid = 2, hiddenOut = 3, hiddenLayer = 4,
           multiply_out = 5, storeMulOut = 6, outputLayer = 7, AnnOut = 8, weightUpdate = 9,
           storeMul = 10, writeWeight = 11;
           
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
    storeMul: begin
      mulVal_hid[0][count] = mulVal0;
      mulVal_hid[1][count] = mulVal1;
      mulVal_hid[2][count] = mulVal2;
      mulVal_hid[3][count] = mulVal3;
      mulVal_hid[4][count] = mulVal4;
      count++;
      nextState = multiply_hid;
    end
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
    hiddenOut: begin
      out_hid[0] = af_out[0];
      out_hid[1] = af_out[1];
      out_hid[2] = af_out[2];
      out_hid[3] = af_out[3];
      out_hid[4] = af_out[4];
      nextState = multiply_out;
    end
    multiply_out: begin
      if (count >4) begin
        count = 0;
        nextState = outputLayer;
      end
      else begin
        weight5 = weight_out[count];
        weight6 = weight_out[count+5];
        weight7 = weight_out[count+10];
        inVal1 = out_hid[count];
        nextState = storeMulOut;
      end
    end
    storeMulOut: begin
      mulVal_out[0][count] = mulVal5;
      mulVal_out[1][count] = mulVal6;
      mulVal_out[2][count] = mulVal7;
      count++;
      nextState = multiply_out;
    end
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
    AnnOut: begin
      out_ann[0] = af_out1[0];
      out_ann[1] = af_out1[1];
      out_ann[2] = af_out1[2];
      nextState = writeWeight;
    end
  endcase
end

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
LFSR rndnm(Clock, Rst, on, data);
endmodule