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

reg [9:0] weight,mulVal;
reg [14:0] addVal_hid[4:0];
reg [9:0] mulVal_hid[4:0][29:0];
reg [9:0] count,data,count0,count2;
reg [7:0] Address;
reg on;

integer i;

parameter 	halt = 0, weightInitiallize = 1, multiply_hid = 2, halt1 = 3, hiddenLayer = 4,
           outputLayer = 5, readWeight1 = 6, halt2 = 7, weightOptimize = 8, weightUpdate = 9,
           halt0 = 10, writeWeight = 11;
           
always@(posedge Clock or negedge Rst) begin
  if(~Rst) begin
    state <= halt;
  end
  else begin
    state <= nextState;
    count0 = count;
  end
end

always@(state,count0) begin
  case(state)
    halt:begin
      on = 1;
      count = 0;
      count2 = 0;
      addVal_hid[0] = 0;
      nextState = weightInitiallize;
    end
    weightInitiallize: begin
      if (count > 149) begin
        count = 0;
        nextState = multiply_hid;
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
      else
        weight = weight_hid[count];
        mulVal_hid[0][count] = mulVal;
        count++;
    end
    hiddenLayer:begin
      if(count > 29) begin
        count = 0;
        nextState = halt1;
        end
      else begin
        addVal_hid[0] = addVal_hid[0] + mulVal_hid[0][count];
        count++;
      end
    end
  endcase
end

multiply mul0(in1[0],weight,mulVal);
/*
multiply mul0(in1[0],weight_hid[0],mulVal_hid[0][0]);
multiply mul1(in1[0],weight_hid[1],mulVal_hid[0][1]);
multiply mul2(in1[0],weight_hid[2],mulVal_hid[0][2]);
multiply mul3(in1[0],weight_hid[3],mulVal_hid[0][3]);
multiply mul4(in1[0],weight_hid[4],mulVal_hid[0][4]);
multiply mul5(in1[0],weight_hid[5],mulVal_hid[0][5]);
multiply mul6(in1[0],weight_hid[6],mulVal_hid[0][6]);
multiply mul7(in1[0],weight_hid[7],mulVal_hid[0][7]);
multiply mul8(in1[0],weight_hid[8],mulVal_hid[0][8]);
multiply mul9(in1[0],weight_hid[9],mulVal_hid[0][9]);
multiply mul10(in1[0],weight_hid[10],mulVal_hid[0][10]);
multiply mul11(in1[0],weight_hid[11],mulVal_hid[0][11]);
multiply mul12(in1[0],weight_hid[12],mulVal_hid[0][12]);
multiply mul13(in1[0],weight_hid[13],mulVal_hid[0][13]);
multiply mul14(in1[0],weight_hid[14],mulVal_hid[0][14]);
multiply mul15(in1[0],weight_hid[15],mulVal_hid[0][15]);
multiply mul16(in1[0],weight_hid[16],mulVal_hid[0][16]);
multiply mul17(in1[0],weight_hid[17],mulVal_hid[0][17]);
multiply mul18(in1[0],weight_hid[18],mulVal_hid[0][18]);
multiply mul19(in1[0],weight_hid[19],mulVal_hid[0][19]);
multiply mul20(in1[0],weight_hid[20],mulVal_hid[0][20]);
multiply mul21(in1[0],weight_hid[21],mulVal_hid[0][21]);
multiply mul22(in1[0],weight_hid[22],mulVal_hid[0][22]);
multiply mul23(in1[0],weight_hid[23],mulVal_hid[0][23]);
multiply mul24(in1[0],weight_hid[24],mulVal_hid[0][24]);
multiply mul25(in1[0],weight_hid[25],mulVal_hid[0][25]);
multiply mul26(in1[0],weight_hid[26],mulVal_hid[0][26]);
multiply mul27(in1[0],weight_hid[27],mulVal_hid[0][27]);
multiply mul28(in1[0],weight_hid[28],mulVal_hid[0][28]);
multiply mul29(in1[0],weight_hid[29],mulVal_hid[0][29]);
*/
LFSR rndnm(Clock, Rst, on, data);
endmodule