module getRealOut(
	input [2:0]out_real,
	output reg [9:0] out_ann_real[2:0]);
	
	integer i;
	
	always@(out_real)begin
		for(i=0;i<3;i++) begin
			if(out_real[i])
				out_ann_real[i] = 10'd1000;
			else
				out_ann_real[i] = 10'd0;
		end
	end
endmodule