module topModule(
	input CLOCK_50,
	input [3:0]KEY, 
	input [17:0]SW, 
	output [17:0]LEDR, 
	output [8:0]LEDG,
	output [6:0]HEX0, 
	output [6:0]HEX1, 
	output [6:0]HEX2, 
	output [6:0]HEX3,
	output [6:0]HEX4,
	output [6:0]HEX5,
	output [6:0]HEX6,
	output [6:0]HEX7);

	reg Clock,Rst,Start;
	reg [9:0] in1 [0:29];
	wire [9:0] out1[2:0];
	wire [9:0] out0[4:0];
	wire [4:0] state;
	reg [9:0] out_ann_real[2:0];
	wire [9:0]weight_out [14:0];
	wire [9:0] count;
	
	
	always@(SW) begin
		if(SW[3:2]==2'b10) begin
			in1[0] = 10'd00;
			in1[1] = 10'd00;
			in1[2] = 10'd00;
			in1[3] = 10'd00;
			in1[4] = 10'd00;
			in1[5] = 10'd00;
			in1[6] = 10'd00;
			in1[7] = 10'd00;
			in1[8] = 10'd00;
			in1[9] = 10'd00;
			in1[10] = 10'd00;
			in1[11] = 10'd00;
			in1[12] = 10'd00;
			in1[13] = 10'd00;
			in1[14] = 10'd00;
			in1[15] = 10'd00;
			in1[16] = 10'd00;
			in1[17] = 10'd00;
			in1[18] = 10'd00;
			in1[19] = 10'd00;
			in1[20] = 10'd00;
			in1[21] = 10'd00;
			in1[22] = 10'd00;
			in1[23] = 10'd00;
			in1[24] = 10'd00;
			in1[25] = 10'd00;
			in1[26] = 10'd00;
			in1[27] = 10'd00;
			in1[28] = 10'd00;
			in1[29] = 10'd00;
		end
		else begin
			in1[0] = 10'd200;
			in1[1] = 10'd200;
			in1[2] = 10'd200;
			in1[3] = 10'd200;
			in1[4] = 10'd200;
			in1[5] = 10'd200;
			in1[6] = 10'd200;
			in1[7] = 10'd200;
			in1[8] = 10'd200;
			in1[9] = 10'd200;
			in1[10] = 10'd200;
			in1[11] = 10'd200;
			in1[12] = 10'd200;
			in1[13] = 10'd200;
			in1[14] = 10'd200;
			in1[15] = 10'd200;
			in1[16] = 10'd200;
			in1[17] = 10'd200;
			in1[18] = 10'd200;
			in1[19] = 10'd200;
			in1[20] = 10'd200;
			in1[21] = 10'd200;
			in1[22] = 10'd200;
			in1[23] = 10'd200;
			in1[24] = 10'd200;
			in1[25] = 10'd200;
			in1[26] = 10'd200;
			in1[27] = 10'd200;
			in1[28] = 10'd200;
			in1[29] = 10'd200;
		end
	end
	
	assign LEDG[7:3] = state;
	assign LEDG[2] = clock1sec;
	assign LEDR[17:8] = weight_out[SW[17:14]];
	//assign LEDR[17:8] = in1[0];
	
always@(SW[8:6])begin
	if (SW[8])
		out_ann_real[2] = 10'd1000;
	else
		out_ann_real[2] = 10'd0;
	if (SW[7])
		out_ann_real[1] = 10'd1000;
	else
		out_ann_real[1] = 10'd0;
	if (SW[6])
		out_ann_real[0] = 10'd1000;
	else
		out_ann_real[0] = 10'd0;
		
end
	wire clock1sec;
Clock_Delay			u19	(
              .iCLK(CLOCK_50),
              .iRST(KEY[0]),
              .oCLK_0(clock1sec),
						);
	
	outVerify test0(CLOCK_50, out1[0], HEX0);
	outVerify test1(CLOCK_50, out1[1], HEX1);
	outVerify test2(CLOCK_50, out1[2], HEX2);
	outVerify test3(CLOCK_50, out0[0], HEX3);
	outVerify test4(CLOCK_50, out0[1], HEX4);
	outVerify test5(CLOCK_50, out0[2], HEX5);
	outVerify test6(CLOCK_50, out0[3], HEX6);
	_7SegmentDisplay asdf(count,HEX7);
	
	DrowsinessDetector1 main(	.Clock(CLOCK_50), 
										.Rst(KEY[0]), 
										.Start(KEY[1]),
										.train(SW[0]),
										.clock1sec(clock1sec), 
										.in1(in1), 
										.out_ann_real(out_ann_real), 
										.out_ann(out1),
										.out_hid(out0), 
										.done(LEDG[0]),
										.doneTraining(LEDG[1]),
										.state(state),
										.weight_out(weight_out));
endmodule