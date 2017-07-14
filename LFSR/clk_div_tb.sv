module clk_div_tb();
reg clk, rst;
wire clk_out;

clk_div t1(clk, rst, clk_out);

initial begin
	clk = 0;
	forever #5 clk=~clk;
end 

initial begin
	rst = 0;
#5 rst = 1;	
#5	rst = 0;
#500 $finish;
end

initial
		$monitor("clk = %b, reset = %b, clk_out = %b", clk, rst, clk_out);
		
endmodule 