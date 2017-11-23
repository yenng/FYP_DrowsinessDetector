
module testing_tb;
  
  reg [4:0]in;
  wire [4:0] out;
  
  initial begin 
    in = 5'b00010;
    
  end
  
  initial begin
    $monitor("in: %d\nout: %d", in,out);
  end
endmodule
