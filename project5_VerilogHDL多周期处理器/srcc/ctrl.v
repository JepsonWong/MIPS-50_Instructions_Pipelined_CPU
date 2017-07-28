
`include    "D:\\srcc\\head.v"  
module controller(reset,clk,op,funct,r,Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelA,ALUSelB,ALUOp,MemWr,whb);
 
input [5:0] op,funct;
input [4:0] r;
input reset,clk;
input [2:0] Zero;
output [7:0]whb;
output [1:0] NPCOp,WDSel,RegDst;
output PCWr,IRWr,RegWr,ExtOp,ALUSelA,ALUSelB,MemWr;
output [3:0] ALUOp;

reg s0,s1,s2,s3,s4,s5,s6,s7,s8,s9;
wire SLL,SRL,SRA,SLLV,SRLV,SRAV,AND,OR,XOR,NOR,ADDI,ADDIU,ANDI,ORI,XORI,LUI,SLTI,SLTIU,BEQ,BNE,BLEZ,BGTZ,BLTZ,BGEZ;
wire J,JAL,JALR,JR;
wire LB,LBU,LH,LHU,LW,SB,SH,SW;
wire ADD,ADDU,SUB,SUBU;
reg [3:0]fsm;
reg pCWr,iRWr,regWr,memWr;

always @ (posedge clk or posedge reset)
  begin
    if(reset)
      fsm<=`S0;
    else
      case(fsm)
        `S0:fsm<=`S1;
        `S1:if(LB|LBU|LH|LHU|LW|SB|SH|SW) fsm<=`S2;
          else
            if(BEQ|BNE|BLEZ|BGTZ|BLTZ|BGEZ)  fsm<=`S8;
            else
              if(JAL|JALR|J|JR)  fsm<=`S9;
              else  fsm<=`S6;
        `S2:if(LB|LBU|LH|LHU|LW) fsm<=`S3;
          else  fsm<=`S5;
        `S3:fsm<=`S4;
        `S4:fsm<=`S0;
        `S5:fsm<=`S0;
        `S6:fsm<=`S7;
        `S7:fsm<=`S0;
        `S8:fsm<=`S0;
        `S9:fsm<=`S0;
        default:fsm<=`S0;
      endcase
  end

always @ (s0 or s1 or s2 or s3 or s4 or s5 or s6 or s7 or s8 or s9)
begin
  pCWr<=s4|s5|s7|s8|s9;
  iRWr<=s0;
  regWr<=s4|s7|(s9&(JAL|JALR));
  memWr<=s5;
end

always @ (fsm)
  begin
  s0<=0;s1<=0;s2<=0;s3<=0;s4<=0;s5<=0;s6<=0;s7<=0;s8<=0;s9<=0; 
  case(fsm)
  `S0:s0<=1;
  `S1:s1<=1;
  `S2:s2<=1;
  `S3:s3<=1;
  `S4:s4<=1;
  `S5:s5<=1;
  `S6:s6<=1;
  `S7:s7<=1;
  `S8:s8<=1;
  `S9:s9<=1;
  endcase 
  end

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

assign whb={LB,LBU,LH,LHU,LW,SB,SH,SW};


assign ALUOp=(LB|LBU|LH|LHU|LW|SB|SH|SW|ADDU|ADDIU) ? `addu:
             (ADD|ADDI)                             ? `add:
             (SUBU|SLTIU|BEQ|BNE)                   ? `subu:
             (SLTI|SUB)                             ? `sub:
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
                                                    4'b1111;
assign WDSel=(ADD|ADDU|SUB|SUBU|SLL|SRL|SRA|SLLV|SRLV|SRAV|AND|OR|XOR|NOR|ADDI|ADDIU|ANDI|ORI|XORI|LUI) ? 2'b00:
             (LB|LBU|LH|LHU|LW) ? 2'b01:
             (JAL|JALR)         ? 2'b10:
             (SLTI|SLTIU)       ? 2'b11:
                                  2'b00;
assign NPCOp=(J|JAL)    ? 2'b10:
             (JR|JALR)            ? 2'b11:
             ((BEQ&Zero[0])|(BNE&(~Zero[0]))|(BLEZ&(Zero[0]|Zero[2]))|(BGTZ&Zero[1])|(BLTZ&Zero[2])|(BGEZ&(Zero[0]|Zero[1]))) ? 2'b01:
                              2'b00; 
assign RegDst=(LB|LBU|LH|LHU|LW|ADDI|ADDIU|ANDI|ORI|XORI|LUI|SLTI|SLTIU) ? 2'b00:
              (JALR|ADD|ADDU|SUB|SUBU|SLL|SRL|SRA|SLLV|SRLV|SRAV|AND|OR|XOR|NOR) ? 2'b01:
              (JAL) ? 2'b10:
              2'b11;

assign ExtOp=(LB|LBU|LH|LHU|LW|SB|SH|SW|ADDI|ADDIU|SLTI|SLTIU) ? 1'b1:

                                                                 1'b0;

assign ALUSelB=(LB|LBU|LH|LHU|LW|SB|SH|SW|ADDI|ADDIU|SLTI|SLTIU|SLL|SRL|SRA|ANDI|ORI|XORI|LUI)? 1'b1:

                                                                  1'b0; 
assign ALUSelA=(SLL|SRL|SRA) ? 1'b1:
                    1'b0;                                                                                                          
assign PCWr=pCWr;
assign IRWr=iRWr;
assign RegWr=regWr;
assign MemWr=memWr;                                                   
                                                    
endmodule


