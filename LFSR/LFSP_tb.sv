module LFSR_tb;

//input
reg Clock, Reset;

//output
wire [9:0] data;

initial begin
	Clock = 0;
	forever #50 Clock = ~Clock;
end

initial begin
		Reset = 1;
#100	Reset = 0;
#100	Reset = 1;
end

LFSR test(Clock, Reset, data);
initial begin
$display("Data = %b \n", data);
end 
endmodule 