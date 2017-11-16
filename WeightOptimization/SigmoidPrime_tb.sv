module SigmoidPrime_tb;
reg [9:0]in;
wire [9:0]out;

SigmoidPrime test(in,out);

initial begin
		in = 10'b0101010011;
	
#30	in = 10'b0011001110;
end

initial begin
	$monitor("In = %d\nOut = %d", in, out);
end
endmodule