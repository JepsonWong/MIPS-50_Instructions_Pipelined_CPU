module aluout(C,clk,ALUOUT);
  input [31:0] C;
  input clk;
  output [31:0] ALUOUT;
  
  reg [31:0] aluout;
  assign ALUOUT=aluout;
  
  always @ (posedge clk)
  begin
    aluout<=C;
  end
  
endmodule
  