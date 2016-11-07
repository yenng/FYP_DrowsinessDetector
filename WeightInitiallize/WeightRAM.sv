module	WeightRAM(
	input	Clock,In,
	input 	[9:0] D[0:9],
	input 	[5:0] Address,
	input 	WE,//'1' write data, '0' read data
	output 	reg	[9:0] Q[0:9]);

	reg [9:0] REGISTER [59:0];
	
	always @(posedge Clock)begin
	if(In) begin
		REGISTER[0] <= 10'b1010101010;
		REGISTER[1] <= 10'b0101010101;
		REGISTER[2] <= 10'b1010101010;
		REGISTER[3] <= 10'b0101010101;
		REGISTER[4] <= 10'b1010101010;
		REGISTER[5] <= 10'b0101010101;
		REGISTER[6] <= 10'b1010101010;
		REGISTER[7] <= 10'b0101010101;
		REGISTER[8] <= 10'b1010101010;
		REGISTER[9] <= 10'b0101010101;
		
		REGISTER[10] <= 10'b0101010101;
		REGISTER[11] <= 10'b0101010101;
		REGISTER[12] <= 10'b0101010101;
		REGISTER[13] <= 10'b0101010101;
		REGISTER[14] <= 10'b0101010101;
		REGISTER[15] <= 10'b0101010101;
		REGISTER[16] <= 10'b0101010101;
		REGISTER[17] <= 10'b0101010101;
		REGISTER[18] <= 10'b0101010101;
		REGISTER[19] <= 10'b0101010101;
		
		REGISTER[20] <= 10'b1111100000;
		REGISTER[21] <= 10'b1111100000;
		REGISTER[22] <= 10'b1111100000;
		REGISTER[23] <= 10'b1111100000;
		REGISTER[24] <= 10'b1111100000;
		REGISTER[25] <= 10'b1111100000;
		REGISTER[26] <= 10'b1111100000;
		REGISTER[27] <= 10'b1111100000;
		REGISTER[28] <= 10'b1111100000;
		REGISTER[29] <= 10'b1111100000;
	end
	else begin
		if(!WE)	begin
			Q[0] <= REGISTER[Address];
			Q[1] <= REGISTER[Address+1];
			Q[2] <= REGISTER[Address+2];
			Q[3] <= REGISTER[Address+3];
			Q[4] <= REGISTER[Address+4];
			Q[5] <= REGISTER[Address+5];
			Q[6] <= REGISTER[Address+6];
			Q[7] <= REGISTER[Address+7];
			Q[8] <= REGISTER[Address+8];
			Q[9] <= REGISTER[Address+9];
			end
		else	begin 
			REGISTER[Address] <= D[0];
			REGISTER[Address+1] <= D[1];
			REGISTER[Address+2] <= D[2];
			REGISTER[Address+3] <= D[3];
			REGISTER[Address+4] <= D[4];
			REGISTER[Address+5] <= D[5];
			REGISTER[Address+6] <= D[6];
			REGISTER[Address+7] <= D[7];
			REGISTER[Address+8] <= D[8];
			REGISTER[Address+9] <= D[9];
			end
		end
	end
endmodule