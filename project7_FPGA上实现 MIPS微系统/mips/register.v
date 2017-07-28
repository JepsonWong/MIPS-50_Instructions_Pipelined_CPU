module register(DIN,DOUT,clk,rst);
input [31:0] DIN;
input clk;
input rst;
output [31:0] DOUT;

reg [31:0] r;

assign DOUT=r;

always @ (posedge clk or  posedge rst)
begin
  if(rst)
    r<=32'b0;
  
else
  
  r<=DIN;
end
  
endmodule