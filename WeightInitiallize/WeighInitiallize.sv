module WeighInitiallize(
	input Clock, WE,In,Rst,
	input [4:0] address,
	output reg [9:0]weight [0:9]
);
reg [9:0] X[0:9];
wire [9:0] Y[0:9];
integer i;
always@(posedge Clock)begin
	weight = Y;
end

//WeightRAM	part2(Clock,In,Rst,X,address,WE,Y);
endmodule
