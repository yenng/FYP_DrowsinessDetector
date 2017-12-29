module WeighInitiallize_tb();
	reg Clock,Rst,Start, training;
	reg [9:0]in[29:0];
	wire [9:0] out0 [4:0];
	wire [9:0] out1 [2:0];
	wire [3:0] state;
	reg [9:0]out_ann_real[2:0];
	wire [2:0]sign1;
	wire [9:0]delta1[2:0];
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		Rst = 1;
		Start = 0; 
		out_ann_real[0] = 10'd2;
		out_ann_real[1] = 10'd999;
		out_ann_real[2] = 10'd2;
		in[0] = 10'd284;
		in[1] = 10'd281;
		in[2] = 10'd279;
		in[3] = 10'd280;
		in[4] = 10'd274;
		in[5] = 10'd255;
		in[6] = 10'd240;
		in[7] = 10'd237;
		in[8] = 10'd224;
		in[9] = 10'd246;
		in[10] = 10'd242;
		in[11] = 10'd240;
		in[12] = 10'd251;
		in[13] = 10'd257;
		in[14] = 10'd251;
		in[15] = 10'd251;
		in[16] = 10'd250;
		in[17] = 10'd0;
		in[18] = 10'd0;
		in[19] = 10'd298;
		in[20] = 10'd301;
		in[21] = 10'd299;
		in[22] = 10'd299;
		in[23] = 10'd301;
		in[24] = 10'd299;
		in[25] = 10'd294;
		in[26] = 10'd302;
		in[27] = 10'd301;
		in[28] = 10'd291;
		in[29] = 10'd295;

#100	Rst = 0;
#100	Rst = 1;
    Start = 1;
    training = 1;
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
	
	//DrowsinessDetector wi(Clock,Rst,Start,training,in,out_ann_real,out1,out0,state,delta1,sign1);
	DrowsinessDetector1 wi1(Clock,Rst,Start,training,in,out_ann_real,out1,out0);
	
	initial begin
		$monitor("In = %p\nOut0 = %p\nOut1 = %p", in, out0, out1);
	end 
	
endmodule