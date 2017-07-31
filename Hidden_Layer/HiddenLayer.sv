module HiddenLayer(
	input Clock, WE,In,
	input [9:0] inVal[0:9],
	output [1:0]outVal
);
reg [9:0] weight0[0:9];
reg [9:0] weight1[0:9];
reg [9:0] weight2[0:9];
reg [9:0] weight3[0:9];
reg [9:0] weight4[0:9];
reg [9:0] weight5[0:9];
reg [9:0] weight6[0:9];
reg [9:0] weight7[0:9];
reg [9:0] weight8[0:9];
reg [9:0] weight9[0:9];

wire [9:0] out0[0:9];
wire [9:0] out1[0:9];
wire [9:0] out2[0:9];
wire [9:0] out3[0:9];
wire [9:0] out4[0:9];
wire [9:0] out5[0:9];
wire [9:0] out6[0:9];
wire [9:0] out7[0:9];
wire [9:0] out8[0:9];
wire [9:0] out9[0:9];

reg [9:0]X[9:0];
integer i;
always@(posedge Clock)begin

end

WeightRAM getWeight0(Clock,In,X,5'b00000,WE,weight0);
//HiddenNeuron neuron0(inVal,weight0,out0);

endmodule
