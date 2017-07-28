



module NPC(NPCOp,Imm_O,JR,PC,NPC,Jal_o);
  input [1:0] NPCOp;
  input [31:0]Imm_O;
  input [31:2] PC,JR;
  output [31:2]NPC;
  output [31:2] Jal_o;
  
  reg [31:2] imm;
  reg [31:2] npc;
  reg [31:2] jal_o;
  
  assign NPC=npc;
  assign Jal_o=jal_o;
  
  always@ (*)
  begin
    imm<={14'b0,Imm_O[15:0]};
    case(NPCOp)
      2'b00:begin
       jal_o<=PC;
       npc<=PC+30'b1;
     end
      2'b01:npc<=PC+imm;
      2'b10:begin
      npc<={PC[31:28],Imm_O[25:0]};
    end
      2'b11:npc<=JR;
    endcase
  end
  
endmodule
