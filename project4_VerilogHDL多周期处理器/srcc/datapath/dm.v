module dm_4k(addr,din,we,clk,dout);
  input [11:2] addr;
  input [31:0] din;
  input clk;
  input we;
  output [31:0] dout;
  
  reg [31:0] dm [1023:0];
  
  always @ (posedge clk)
  if(we) 
  dm[addr]<=din;
  
  assign dout=dm[addr];
endmodule
