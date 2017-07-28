module MINU(DIN,clk,rst,DOU,d);
  input [31:0] DIN;
  input clk,rst;
  output [7:0] DOU;
  output [7:0] d;
  
  wire [31:0] Dout;
  
  sww SWW(DIN,Dout);
  printf PRINTF(clk,reset,Dout,DOU,d);
  
endmodule
  
  