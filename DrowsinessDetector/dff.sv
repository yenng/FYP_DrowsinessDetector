module dff_ann(
input  wire [9:0]data[2:0]  , // Data Input
input  wire clk   , // Clock Input
input  wire reset , // Reset input 
output reg  [9:0]q[2:0]       // Q output
);
//-------------Code Starts Here---------
always@ ( posedge clk or negedge reset)
if (~reset) begin
  q[0] <= 10'b0;
  q[1] <= 10'b0;
  q[2] <= 10'b0;
end else begin
  q <= data;
end

endmodule //End Of Module dff_async_reset