module NPC(NPCOp,Imm_O,JR,PC,NPC,EPC);
  
input [31:2] EPC;
  input [2:0] NPCOp;
  input [31:0]Imm_O;
  input [31:2] PC;
  input [31:0] JR;
  output [31:2]NPC;
  
  reg [31:2] imm;
  reg [31:2] npc;
  
  assign NPC=npc;
  
  always@ (*)
  begin
    imm<={{14{Imm_O[15]}},Imm_O[15:0]};
    case(NPCOp)
      3'b001:npc<=PC+imm+30'b1;//beq
      3'b010:begin
      npc<={PC[31:28],Imm_O[25:0]};//jal
    end
      3'b011:npc<=JR[31:2];//jr
      3'b100:npc<=EPC;
      3'b101:npc<=30'b000000000000000001000001100000;//??
    endcase
  end
  
endmodule