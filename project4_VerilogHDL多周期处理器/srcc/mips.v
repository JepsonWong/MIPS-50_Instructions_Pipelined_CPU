module mips(clk,reset);
  input clk;
  input reset;
  
  wire [5:0] op;
  wire [15:0] Imm;
  wire PCWr,IRWr,RegWr,ExtOp,ALUSelB,MemWr,Zero;
  wire [1:0] NPCOp,WDSel,RegDst;
  wire [2:0] ALUOp;
    
  controller CONTROLLER(reset,clk,op,Imm[5:0],Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelB,ALUOp,MemWr);
  datapath DATAPATH(clk,reset,op,Imm,Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelB,ALUOp,MemWr);
  
endmodule
