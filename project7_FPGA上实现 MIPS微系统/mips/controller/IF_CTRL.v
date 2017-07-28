`include    "D:\\srcc\\head.v"  
module IF_CTRL(IntReq_W,op,funct,r,cop0,Zero,NPCOp,ExtOp,JALRR,BEQQ,MTC00,CP0_Wen_D,EXLClr,EPCWr_D,EXLSet_D);
  
  input IntReq_W;
  input [5:0] op,funct;
  input [4:0] r,cop0;
  input [2:0] Zero;
  output ExtOp;
  output [2:0] NPCOp; 
  output JALRR;
  output BEQQ;
  output MTC00;
  output CP0_Wen_D;
  output EXLClr,EPCWr_D,EXLSet_D;
  
  wire SLL,SRL,SRA,SLLV,SRLV,SRAV,AND,OR,XOR,NOR,ADDI,ADDIU,ANDI,ORI,XORI,LUI,SLTI,SLTIU,SLT,SLTU,BEQ,BNE,BLEZ,BGTZ,BLTZ,BGEZ;
  wire J,JAL,JALR,JR;
  wire LB,LBU,LH,LHU,LW,SB,SH,SW;
  wire ADD,ADDU,SUB,SUBU;
  wire ERET,MFC0,MTC0;
  wire DIV,DIVU,MULT,MULTU,MFHI,MFLO,MTHI,MTLO;
  
  assign JALRR=JALR|JR;
  assign BEQQ=BEQ|BNE|BLEZ|BGTZ|BLTZ|BGEZ;
  assign MTC00=MTC0;
  assign CP0_Wen_D=(MTC0) ? 1'b1:1'b0;
  assign EXLClr=(ERET) ? 1'b1:1'b0;
  assign EPCWr_D=(IntReq_W) ? 1'b1:1'b0;
  assign EXLSet_D=(IntReq_W) ? 1'b1:1'b0;
  
assign SLL=((funct==`SLL)&(op==`R))?1:0;
assign SRL=((funct==`SRL)&(op==`R))?1:0;
assign SRA=((funct==`SRA)&(op==`R))?1:0;
assign SLLV=((funct==`SLLV)&(op==`R))?1:0;
assign SRLV=((funct==`SRLV)&(op==`R))?1:0;
assign SRAV=((funct==`SRAV)&(op==`R))?1:0;
assign AND=((funct==`AND)&(op==`R))?1:0;
assign OR=((funct==`OR)&(op==`R))?1:0;
assign XOR=((funct==`XOR)&(op==`R))?1:0;
assign NOR=((funct==`NOR)&(op==`R))?1:0;
assign ADDI=(op==`ADDI)?1:0;
assign ADDIU=(op==`ADDIU)?1:0;
assign ANDI=(op==`ANDI)?1:0;
assign ORI=(op==`ORI)?1:0;
assign XORI=(op==`XORI)?1:0;
assign LUI=(op==`LUI)?1:0;
assign SLTI=(op==`SLTI)?1:0;
assign SLTIU=(op==`SLTIU)?1:0;
assign SLT=((funct==`SLT)&(op==`R))?1:0;
assign SLTU=((funct==`SLTU)&(op==`R))?1:0;
assign BEQ=(op==`BEQ)?1:0;
assign BNE=(op==`BNE)?1:0;
assign BLEZ=(op==`BLEZ)?1:0;
assign BGTZ=(op==`BGTZ)?1:0;
assign BLTZ=((op==`BLTZ_BGEZ)&(r==`BLTZ))?1:0;//
assign BGEZ=((op==`BLTZ_BGEZ)&(r==`BGEZ))?1:0;//
assign J=(op==`J)?1:0;
assign JAL=(op==`JAL)?1:0;
//assign JALR=((funct==`JALR)&(op==`R))?1:0;
assign JALR=((funct==`JALR)&(op==`R))?1:0;
assign JR=((funct==`JR)&(op==`R))?1:0;
assign LB=(op==`LB)?1:0;
assign LBU=(op==`LBU)?1:0;
assign LH=(op==`LH)?1:0;
assign LHU=(op==`LHU)?1:0;
assign LW=(op==`LW)?1:0;
assign SB=(op==`SB)?1:0;
assign SH=(op==`SH)?1:0;
assign SW=(op==`SW)?1:0;
assign ADD=((funct==`ADD)&(op==`R))?1:0;
assign ADDU=((funct==`ADDU)&(op==`R))?1:0;
assign SUB=((funct==`SUB)&(op==`R))?1:0;
assign SUBU=((funct==`SUBU)&(op==`R))?1:0;
assign ERET=((op==`COP0)&(funct==`ERET)&(cop0[4]==1'b1))?1:0;
assign MFC0=((op==`COP0)&(cop0==`MFC0))?1:0;
assign MTC0=((op==`COP0)&(cop0==`MTC0))?1:0;
assign DIV=((op==`R)&(funct==`DIV))?1:0;
assign DIVU=((op==`R)&(funct==`DIVU))?1:0;
assign MULT=((op==`R)&(funct==`MULT))?1:0;
assign MULTU=((op==`R)&(funct==`MULTU))?1:0;
assign MFHI=((op==`R)&(funct==`MFHI))?1:0;
assign MFLO=((op==`R)&(funct==`MFLO))?1:0;
assign MTHI=((op==`R)&(funct==`MTHI))?1:0;
assign MTLO=((op==`R)&(funct==`MTLO))?1:0;


assign NPCOp=IntReq_W   ? 3'b101:
             (J|JAL)    ? 3'b010:
             (JR|JALR)            ? 3'b011:
             ((BEQ&Zero[0])|(BNE&(~Zero[0]))|(BLEZ&(Zero[0]|Zero[2]))|(BGTZ&Zero[1])|(BLTZ&Zero[2])|(BGEZ&(Zero[0]|Zero[1]))) ? 3'b001:
             (ERET)     ? 3'b100:
                              3'b000; 
assign ExtOp=(LB|LBU|LH|LHU|LW|SB|SH|SW|ADDI|ADDIU|SLTI|SLTIU) ? 1'b1:

                                                                 1'b0;

endmodule 