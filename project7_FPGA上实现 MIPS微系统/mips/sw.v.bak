module sw(Din,in,address,WE,Dout);
  
  input [31:0] Din;
  input [31:0] in;
  input address;
  input WE;
  output [31:0] Dout;
  
  reg [31:0] m;
  
  always @ (in)
  begin
    m<=in;
  end
  
  always @ (Din)
  begin
    if(WE&&(~address))
      m<=Din;  
 
 end
  
  assign Dout=(~address)?m:32'bx;
  
endmodule
  