
module PC(CLK_I,Reset_I,PCWr,NPC_I,PC_O);
  input CLK_I;
  input Reset_I;
  input PCWr;
  input [31:2]NPC_I;
  output [31:2]PC_O;
  
  reg [31:2]addr;
  
  assign PC_O=addr;
  
  always@ (posedge CLK_I or posedge Reset_I)
  begin
    if(Reset_I)
      addr<=30'b000000000000000000110000000000;
    else
      if(PCWr)
      addr<=NPC_I;
  end
endmodule
