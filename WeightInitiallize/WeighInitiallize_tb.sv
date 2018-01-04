module WeighInitiallize_tb();
	reg Clock,Rst,Start, training,clock1sec;
	reg [9:0]in[29:0];
	wire [9:0] out0 [4:0];
	wire [9:0] out1 [2:0];
	wire [4:0] state;
	wire [9:0]out_ann_real[2:0];
	wire [2:0]sign1;
	reg [2:0] in_ann;
	wire [9:0]delta1[2:0];
	wire done,doneTraining;
	wire [9:0]weight_out [14:0];
	wire [9:0] count;
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	initial begin
	  clock1sec = 0;
		forever #100 clock1sec = ~clock1sec;
	end
	initial begin
		Rst = 1;
		Start = 0; 
		training = 1;
		in_ann = 3'b111;
		in[0] = 10'd200;
		in[1] = 10'd200;
		in[2] = 10'd200;
		in[3] = 10'd200;
		in[4] = 10'd200;
		in[5] = 10'd200;
		in[6] = 10'd200;
		in[7] = 10'd200;
		in[8] = 10'd200;
		in[9] = 10'd200;
		in[10] = 10'd200;
		in[11] = 10'd200;
		in[12] = 10'd200;
		in[13] = 10'd200;
		in[14] = 10'd200;
		in[15] = 10'd200;
		in[16] = 10'd200;
		in[17] = 10'd200;
		in[18] = 10'd200;
		in[19] = 10'd200;
		in[20] = 10'd200;
		in[21] = 10'd200;
		in[22] = 10'd200;
		in[23] = 10'd200;
		in[24] = 10'd200;
		in[25] = 10'd200;
		in[26] = 10'd200;
		in[27] = 10'd200;
		in[28] = 10'd200;
		in[29] = 10'd200;

#100	Rst = 0;
#100	Rst = 1;
    Start = 0;
#30000
		in[0] = 10'd123;
		in[1] = 10'd4;
		in[2] = 10'd512;
		in[3] = 10'd555;
		in[4] = 10'd123;
		in[5] = 10'd421;
		in[6] = 10'd110;
		in[7] = 10'd501;
		in[8] = 10'd320;
		in[9] = 10'd62;
		in[10] = 10'd1;
		in[11] = 10'd32;
		in[12] = 10'd7;
		in[13] = 10'd8;
		in[14] = 10'd52;
		in[15] = 10'd90;
		in[16] = 10'd6;
		in[17] = 10'd78;
		in[18] = 10'd87;
		in[19] = 10'd02;
		in[20] = 10'd999;
		in[21] = 10'd7;
		in[22] = 10'd12;
		in[23] = 10'd37;
		in[24] = 10'd82;
		in[25] = 10'd914;
		in[26] = 10'd328;
		in[27] = 10'd367;
		in[28] = 10'd178;
		in[29] = 10'd44;
		end
	getRealOut dfdfdfdf(in_ann,out_ann_real);
	//DrowsinessDetector wi(Clock,Rst,Start,training,in,out_ann_real,out1,out0,state,delta1,sign1);
	DrowsinessDetector1 wi1(Clock,Rst,Start,training,Clock,in,out_ann_real,out1,out0,done,doneTraining,state,weight_out);
	
	initial begin
		$monitor("In = %p\nOut0 = %p\nOut1 = %p", in, out0, out1);
	end 
	
endmodule