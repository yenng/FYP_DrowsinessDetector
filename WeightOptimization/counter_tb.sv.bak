module counter_tb();
	reg clk,rst;
	reg [9:0]max;
	wire [9:0]count;
	
	counter test(clk,rst,max,count);
	
	initial begin
		rst = 0;
		max = 10'd10;
		#100 rst = 1;
		#100 rst = 0;
	end
	
	initial begin
		clk = 0;
		forever #10 clk = !clk;
	end
	
	initial begin
		$monitor("Counter: %p", count);
	end
	
	endmodule 