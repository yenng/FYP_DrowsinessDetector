module multiply(
input [9:0] in1,
input signed [9:0] in2,
output reg signed [19:0]mulVal
);
real in2_abs,mulVal_t;
//in2 is the value of weight, the data might be negative.

assign mulVal_t = in1*in2_abs;

//get the positive value of the data.
assign in2_abs = in2[9] ? -in2 : in2;

//the final answer will be negative if the value of weight is negative. 
assign mulVal = in2[9] ? -mulVal_t : mulVal_t;
endmodule