module Download(
	input [17:0] SW,
	input [0:0]KEY,
	output [9:0] LEDR
);

reg [9:0] weight [0:9];
integer i;
always@(posedge KEY[0]) begin
	for(i=0;i<10;i++) begin
		LEDR[9:0] = weight[i];
	end
	i = 0;
end


WeighInitiallize test(SW[17],SW[16],SW[15],SW[14],SW[4:0],weight);
//WeighInitiallize test(Clock,WE,In,Rst,address,weight);

endmodule