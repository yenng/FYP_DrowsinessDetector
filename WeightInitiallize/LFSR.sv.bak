module LFSR(
  input  clk,
  input  rst_n,

  output reg [9:0] data
);

wire feedback = data[9] ^ data[6] ;

always @(posedge clk or negedge rst_n)
  if (~rst_n) 
    data <= 10'hF;
  else
    data <= {data[8:0], feedback} ;

endmodule