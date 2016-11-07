module HiddenNueron(
	input [9:0] inVal[9:0],
	input [9:0] weight[9:0],
	output [9:0]outVal
);

int t=0;
reg [9:0]mulVal[9:0];
reg [9:0]mulValPos[9:0];
reg [9:0]val[1024:0];

//multiply input and weight then get the first 10 bits of data.
assign val[0] = inVal[0]*weight[0];
assign mulVal[0] = val[t][0:9];
assign val[1] = inVal[1]*weight[1];
assign mulVal[1] = val[t][0:9];
assign val[2] = inVal[2]*weight[2];
assign mulVal[2] = val[t][0:9];
assign val[3] = inVal[3]*weight[3];
assign mulVal[3] = val[t][0:9];
assign val[4] = inVal[4]*weight[4];
assign mulVal[4] = val[t][0:9];
assign val[5] = inVal[5]*weight[5];
assign mulVal[5] = val[t][0:9];
assign val[6] = inVal[6]*weight[6];
assign mulVal[6] = val[t][0:9];
assign val[7] = inVal[7]*weight[7];
assign mulVal[7] = val[t][0:9];
assign val[8] = inVal[8]*weight[8];
assign mulVal[8] = val[t][0:9];
assign val[9] = inVal[9]*weight[9];
assign mulVal[9] = val[t][0:9];

/*get absolute value of the mulVal
assign mulValPos[0] = mulVal[0][9] ? -mulVal[0] : mulVal[0]; 
assign mulValPos[1] = mulVal[1][9] ? -mulVal[1] : mulVal[1]; 
assign mulValPos[2] = mulVal[2][9] ? -mulVal[2] : mulVal[2]; 
assign mulValPos[3] = mulVal[3][9] ? -mulVal[3] : mulVal[3]; 
assign mulValPos[4] = mulVal[4][9] ? -mulVal[4] : mulVal[4]; 
assign mulValPos[5] = mulVal[5][9] ? -mulVal[5] : mulVal[5]; 
assign mulValPos[6] = mulVal[6][9] ? -mulVal[6] : mulVal[6]; 
assign mulValPos[7] = mulVal[7][9] ? -mulVal[7] : mulVal[7]; 
assign mulValPos[8] = mulVal[8][9] ? -mulVal[8] : mulVal[8]; 
assign mulValPos[9] = mulVal[9][9] ? -mulVal[9] : mulVal[9]; 
*/

/*********************************************
 * activation function done here,				*
 * the formula is f(X) = 0.5[X/(1+|X|)+1]		*
 *********************************************/


endmodule 