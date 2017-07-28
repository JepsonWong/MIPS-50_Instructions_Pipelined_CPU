module b(RD2,clk,B);
  input [31:0] RD2;
  input clk;
  output [31:0] B;
  
  reg [31:0] b;
  assign B=b;
  
  always @ (posedge clk)
  begin
    b<=RD2;
  end
  
endmodule
  