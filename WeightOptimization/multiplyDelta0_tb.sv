module multiplyDelta0_tb();
  
  reg signed [9:0]addVal[0:4];
  reg [9:0]out0_exp[0:4];
  wire [0:4]sign0;
  wire [9:0]delta0[0:4];

  multiplyDelta0 test(addVal,out0_exp,sign0,delta0);
  
  initial begin
    addVal[0] = -199;
    addVal[1] = 99;
    addVal[2] = -23;
    addVal[3] = 14;
    addVal[4] = -100;
    out0_exp[0] = 499;
    out0_exp[1] = 499;
    out0_exp[2] = 499;
    out0_exp[3] = 499;
    out0_exp[4] = 499;
  end
  
  initial begin 
    $monitor("Sign = %b\nDelta = \n%p\n%p\n%p\n%p\n%p",sign0,delta0[0],delta0[1],delta0[2],delta0[3],delta0[4]);
  end
endmodule