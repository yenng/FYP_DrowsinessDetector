module multiplyDelta0(
  input signed [9:0]addVal[0:4],
  input [9:0]out0_exp[0:4],
  output reg[0:4]sign0,
  output reg[9:0]delta0[0:4]);
  
  integer i;
  reg [9:0] addVal_abs[0:4];
  
  always@(*) begin
    for(i = 0; i<5; i = i+1) begin
      addVal_abs[i] = addVal[i][9] ? -addVal[i] : addVal[i];
      sign0[i] = addVal[i][9] ? 1'b1: 1'b0;
      delta0[i] = addVal_abs[i]*out0_exp[i]/1000;
    end
  end
endmodule

  
