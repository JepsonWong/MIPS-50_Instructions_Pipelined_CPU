module mips(clk,reset,PrAddr,BE,PrDIn,PrDOut,Wen,HWInt);
  input clk;
  input reset;
  output [31:2] PrAddr;
  output [3:0] BE;
  input [31:0] PrDIn;
  output [31:0] PrDOut;
  output Wen;
  input [7:2] HWInt;
  
  wire [5:0] op;
  wire [31:0] Imm;
  wire PCWr,IRWr,RegWr,ExtOp,ALUSelA,ALUSelB,MemWr,DM_Sel;
  wire [2:0] Zero;
  
wire [2:0] NPCOp,WDSel;
  wire [1:0] RegDst;
  wire [4:0] ALUOp;
  wire [7:0] whb;
  wire [3:0] be;
  wire [31:0] ALUOUT;
  wire [31:0] B;
  wire IntReq;
  wire CP0_Wen,EPCWr,EXLSet,EXLClr,MUL_DIV_Sel,MUL_DIV_Wr;
  
  assign Wen=((ALUOUT>=32'h00007F00)&((whb[0]==1'b1)|(whb[1]==1'b1)|(whb[2]==1'b1))) ? 1:0;
  assign PrAddr=ALUOUT[31:2];
  assign BE=be;
  assign PrDOut=((whb[0]==1'b1)|(whb[1]==1'b1)|(whb[2]==1'b1)) ? B:32'hx;
    
  controller CONTROLLER(reset,clk,Imm[31:26],Imm[5:0],Imm[20:16],Imm[25:21],ALUOUT,Zero,IntReq,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelA,ALUSelB,ALUOp,MemWr,whb,CP0_Wen,EPCWr,EXLSet,EXLClr,MUL_DIV_Sel,MUL_DIV_Wr,DM_Sel);
  datapath DATAPATH(clk,reset,Imm,Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelA,ALUSelB,ALUOp,MemWr,whb,be,ALUOUT,B,CP0_Wen,EPCWr,EXLSet,EXLClr,MUL_DIV_Sel,MUL_DIV_Wr,IntReq,HWInt,PrDIn,DM_Sel);
  
endmodule