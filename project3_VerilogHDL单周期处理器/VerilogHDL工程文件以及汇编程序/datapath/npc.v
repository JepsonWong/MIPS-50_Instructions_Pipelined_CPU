



module NPC(Imm_O,Br,Zero,PC,NPC);
  input [15:0]Imm_O;
  input Br;
  input Zero;
  input [31:2] PC;
  output [31:2]NPC;
  
  reg [31:2] imm;
  reg [31:2] npc;
  assign NPC=npc;
  
  always@ (Br or Zero or PC or Imm_O)
  begin
    imm<={14'b0,Imm_O};
    if(Br&Zero)
     npc<=PC+30'b1+imm;
    else
     npc<=PC+30'b1;
  end
endmodule

  
  