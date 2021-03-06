module testing(
  input clk, rst,
  input [4:0]in,
  output reg [4:0] out,out1);
  //reg [4:0] in;
  //reg [4:0] out;
  integer i;
  always@(posedge clk)begin 
    for (i = 0; i<5; i=i+1)
      addition(clk,rst,in,out,out1);
  end

task addition;
  input clock, reset;
  input [4:0]x;
  output [4:0]y;
  output [4:0]z;
  
  @(posedge clock or negedge reset)begin
    if(reset)
      y <= 0;
    else begin
      y += x;
      z = x+x;
    end
  end
endtask

endmodule