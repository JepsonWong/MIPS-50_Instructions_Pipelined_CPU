`include    "D:\\srcc\\head.v"  
module controller(reset,clk,op,funct,Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelB,ALUOp,MemWr);
  input [5:0] op,funct;
  input reset,clk,Zero;
  output [1:0] NPCOp,WDSel,RegDst;
  output PCWr,IRWr,RegWr,ExtOp,ALUSelB,MemWr;
  output [2:0] ALUOp;
  
  reg [1:0] nPCOp,wDSel,regDst;
  reg pCWr,iRWr,regWr,extOp,aLUSelB,memWr;
  reg [2:0] aLUOp;
  reg s0,s1,s2,s3,s4,s5,s6,s7,s8,s9;
  reg [3:0]fsm;
  
  assign PCWr=pCWr;
  assign NPCOp=nPCOp;
  assign WDSel=wDSel;
  assign RegDst=regDst;
  assign IRWr=iRWr;
  assign RegWr=regWr;
  assign ExtOp=extOp;
  assign ALUSelB=aLUSelB;
  assign MemWr=memWr;
  assign ALUOp=aLUOp;
  
  always @ (posedge clk or posedge reset)
  begin
    if(reset)
      fsm<=`S0;
    else
      case(fsm)
        `S0:fsm<=`S1;
        `S1:if((op==`LW)|(op==`SW)) fsm<=`S2;
          else
            if(op==`BEQ)  fsm<=`S8;
            else
              if((op==`JAL)|(op==`J)|(funct==`JR))  fsm<=`S9;
              else  fsm<=`S6;
        `S2:if(op==`LW) fsm<=`S3;
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
  
  always @ (s0 or s1 or s2 or s3 or s4 or s5 or s6 or s7 or s8 or s9 or Zero or op or funct)
  begin
  memWr<=s5;
  pCWr<=s0|(s8&Zero)|s9;
  iRWr<=s0;
  nPCOp[0]<=((op==`BEQ)&s8)|((funct==`JR)&s9);
  nPCOp[1]<=((op==`JAL)&s9)|((op==`J)&s9)|((funct==`JR)&s9);
  wDSel[0]<=((op==`LW)&s4);
  wDSel[1]<=((op==`JAL)&s9);
  regDst[0]<=(((funct==`ADDU)|(funct==`SUBU))&s7);
  regDst[1]<=((op==`JAL)&s9)|((funct==`JR)&s9);
  regWr<=(((funct==`ADDU)|(funct==`SUBU))&s7)|(((op==`ORI)|(op==`LUI))&s7)|((op==`LW)&s4)|(((op==`J)|(op==`JAL))&s9);
  extOp<=((op==`LW)&s2)|((op==`SW)&s2);
  aLUSelB<=((op==`LW)&s2)|((op==`SW)&s2)|((op==`ORI)&s6)|((op==`LUI)&s6);
  aLUOp[0]<=((funct==`SUBU)&s6)|((op==`BEQ)&s8)|((op==`LUI)&s6);
  aLUOp[1]<=((op==`ORI)&s6)|((op==`LUI)&s6);
  aLUOp[2]<=0;
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
    
endmodule