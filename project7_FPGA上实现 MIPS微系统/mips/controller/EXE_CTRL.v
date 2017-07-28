`include    "D:\\srcc\\head.v"  
module EXE_CTRL(op,funct,r,cop0,ALUOp,ALUSelA,ALUSelB,RegDst,WDSel,MUL_DIV_Sel,MUL_DIV_Wr,JAL_E,JALR_E,B_E,LW_E,R_E,I_E,SW_E);
  input [5:0] op,funct;
  input [4:0] r,cop0;
  output [4:0] ALUOp;
  output ALUSelA,ALUSelB;
  output [1:0] RegDst;
  output [2:0] WDSel;
  output MUL_DIV_Sel,MUL_DIV_Wr;
  output JAL_E,B_E,LW_E,R_E,I_E,SW_E,JALR_E;
  
 
  
  wire SLL,SRL,SRA,SLLV,SRLV,SRAV,AND,OR,XOR,NOR,ADDI,ADDIU,ANDI,ORI,XORI,LUI,SLTI,SLTIU,SLT,SLTU,BEQ,BNE,BLEZ,BGTZ,BLTZ,BGEZ;
  wire J,JAL,JALR,JR;
  wire LB,LBU,LH,LHU,LW,SB,SH,SW;
  wire ADD,ADDU,SUB,SUBU;
  wire ERET,MFC0,MTCO;
  wire DIV,DIVU,MULT,MULTU,MFHI,MFLO,MTHI,MTLO;
  
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
assign MTCO=((op==`COP0)&(cop0==`MTC0))?1:0;
assign DIV=((op==`R)&(funct==`DIV))?1:0;
assign DIVU=((op==`R)&(funct==`DIVU))?1:0;
assign MULT=((op==`R)&(funct==`MULT))?1:0;
assign MULTU=((op==`R)&(funct==`MULTU))?1:0;
assign MFHI=((op==`R)&(funct==`MFHI))?1:0;
assign MFLO=((op==`R)&(funct==`MFLO))?1:0;
assign MTHI=((op==`R)&(funct==`MTHI))?1:0;
assign MTLO=((op==`R)&(funct==`MTLO))?1:0;

  assign JAL_E=JAL;
  assign JALR_E=JALR;
  assign B_E=BEQ|BNE|BLEZ|BGTZ|BLTZ|BGEZ;
  assign LW_E=LW|LB|LBU|LH|LHU;
  assign R_E=SLLV|SRLV|SRAV|AND|OR|XOR|NOR|SLL|SRL|SRA|SLT|SLTU|ADD|ADDU|SUB|SUBU|DIV|DIVU|MULT|MULTU;
  assign I_E=ADDI|ADDIU|ANDI|ORI|XORI|LUI|SLTI|SLTIU|MTHI|MTLO;
  assign SW_E=SW|SB|SH;

assign ALUSelB=(LB|LBU|LH|LHU|LW|SB|SH|SW|ADDI|ADDIU|SLTI|SLTIU|SLL|SRL|SRA|ANDI|ORI|XORI|LUI)? 1'b1:

                                                                  1'b0; 
assign ALUSelA=(SLL|SRL|SRA) ? 1'b1:
                    1'b0;  
assign ALUOp=(LB|LBU|LH|LHU|LW|SB|SH|SW|ADDU|ADDIU) ? `addu:
             (ADD|ADDI)                             ? `add:
             (SUBU|SLTIU|BEQ|BNE)                   ? `subu:
             (SLTI|SUB|SLT)                         ? `sub:
             (AND|ANDI)                             ? `andi:
             (OR|ORI)                               ? `ori:
             (XOR|XORI)                             ? `xori:
             (NOR)                                  ? `nori:
             (LUI)                                  ? `lui:
             (SLL)                                  ? `sll:
             (SRL)                                  ? `srl:
             (SRA)                                  ? `sra:
             (SLLV)                                 ? `sllv:
             (SRLV)                                 ? `srlv:
             (SRAV)                                 ? `srav:
             (BLEZ|BGTZ|BLTZ|BGEZ)                  ? `BLEZ_BGTZ_BLTZ_BGEZ:
             (SLTIU|SLTU)                           ? `sltu:
             (DIV)                                  ? `div:
             (DIVU)                                 ? `divu:
             (MULT)                                 ? `mult:
             (MULTU)                                ? `multu:
                                                    5'b11111;
                                                    
assign RegDst=(LB|LBU|LH|LHU|LW|ADDI|ADDIU|ANDI|ORI|XORI|LUI|SLTI|SLTIU|MFC0) ? 2'b00:
              (JALR|ADD|ADDU|SUB|SUBU|SLL|SRL|SRA|SLLV|SRLV|SRAV|AND|OR|XOR|NOR|SLT|SLTU|MFHI|MFLO) ? 2'b01:
              (JAL) ? 2'b10:
              2'b11;
              
assign WDSel=(ADD|ADDU|SUB|SUBU|SLL|SRL|SRA|SLLV|SRLV|SRAV|AND|OR|XOR|NOR|ADDI|ADDIU|ANDI|ORI|XORI|LUI) ? 3'b000:
             (SLTI|SLTIU|SLT|SLTU)   ? 3'b001:
             (MFLO)                  ? 3'b010:
             (MFHI)                  ? 3'b011:
             (JAL|JALR)              ? 3'b100:
             (MFC0)                  ? 3'b101:         
                                       3'b000;
                                       
assign MUL_DIV_Sel=(MFHI|MTHI) ? 1'b1:
                   (MFLO|MTLO) ? 1'b0:
                            1'bz;

assign MUL_DIV_Wr=(MTHI|MTLO) ? 1'b1:1'b0;

endmodule