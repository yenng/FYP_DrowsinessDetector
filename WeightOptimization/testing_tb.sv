
module testing_tb;
  reg clk, rst;
  reg [4:0]in;
  wire [4:0] out;
  wire [4:0] out1;
  
  initial begin 
    rst = 1;
    #500
    rst = 0;
    in = 5'b00010;
    #500
    in = 5'b00001;
    
  end
  
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end
  
  initial begin
    $monitor("in: %d\nout: %d\nout1: %d", in,out,out1);
  end
  testing test(clk,rst,in, out,out1);
endmodule
