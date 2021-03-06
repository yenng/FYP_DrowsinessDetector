module Delta_tb;
reg [9:0]err;
reg [9:0]sig_prime;
wire [9:0]delta;

Delta test(err,sig_prime,delta);

initial begin
		err = 10'b0000111101;
		sig_prime = 10'b1010101010;
#30 	err = 10'b0010011001;
		sig_prime = 10'b0001110101;
end 

initial begin 
	$monitor("Err = %d\nSig = %d\nDelta = %d", err, sig_prime, delta);
end
endmodule 