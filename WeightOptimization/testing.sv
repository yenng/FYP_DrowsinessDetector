module testing(
  input [4:0]in,
  output [4:0]out);
  
  integer i;
  always@(in)begin 
    for (i = 0; i<5; i=i+1)
      addition(in,out);
  end

task addition;
  reg [4:0]x;
  reg [4:0]y;
  
  begin
    y += x;
  end
endtask

endmodule