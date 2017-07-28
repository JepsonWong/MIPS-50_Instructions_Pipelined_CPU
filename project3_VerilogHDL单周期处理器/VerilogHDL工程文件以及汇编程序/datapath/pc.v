



module PC(CLK_I,Reset_I,NPC_I,PC_O);
  input CLK_I;
  input Reset_I;
  input [31:2]NPC_I;
  output [31:2]PC_O;
  
  reg [31:2]addr;
  
  assign PC_O=addr;
  
  always@ (posedge CLK_I or posedge Reset_I)
  begin
    if(Reset_I)
      addr<=30'h0;
    else
      addr<=NPC_I;
  end
endmodule
