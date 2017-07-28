module mips(clk,reset);
  input clk;
  input reset;
  
  wire [5:0] op;
  wire [31:0] Imm;
  wire PCWr,IRWr,RegWr,ExtOp,ALUSelA,ALUSelB,MemWr;
  wire [2:0] Zero;
  wire [1:0] NPCOp,WDSel,RegDst;
  wire [3:0] ALUOp;
  wire [7:0] whb;
    
  controller CONTROLLER(reset,clk,Imm[31:26],Imm[5:0],Imm[20:16],Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelA,ALUSelB,ALUOp,MemWr,whb);
  datapath DATAPATH(clk,reset,Imm,Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelA,ALUSelB,ALUOp,MemWr,whb);
  
endmodule