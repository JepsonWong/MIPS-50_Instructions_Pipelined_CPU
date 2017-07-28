module datapath(clk,reset,op,Imm,Zero,NPCOp,PCWr,IRWr,WDSel,RegDst,RegWr,ExtOp,ALUSelB,ALUOp,MemWr);
  input clk;
  input reset;
  output [5:0] op;
  output [15:0] Imm;
  output Zero;
  input PCWr,IRWr,RegWr,ExtOp,ALUSelB,MemWr;
  input [2:0] ALUOp;
  input [1:0] NPCOp,WDSel,RegDst;
  
  wire [31:2] Jal_O;
  wire [31:2] nPC;
  wire [31:2] pC;
  wire [4:0] RS1,RS2;
  wire [4:0] RD,RM;
  wire [31:0] WData;
  wire [31:0] RD1,RD2;
  wire [31:0] Ext;
  wire [31:0] A,B,BS,C,ALUOUT,R;
  wire [31:0] ReadData;
  wire [31:0] instr;
  
  NPC npc(NPCOp,{op,RS1,RS2,Imm},RD2[31:2],pC,nPC,Jal_O);
  PC  U_PC(clk,reset,PCWr,nPC,pC);
  im_4k U_IM(pC[11:2],instr);
  ir  IR(clk,instr,IRWr,op,RS1,RS2,Imm); 
  mux MUX1(RS2,Imm[15:11],5'b11111,5'b0,RegDst[0],RegDst[1],RD);
      defparam MUX1.size_data = 5 ;
  
  mux MUX4(RS2,5'b11111,5'b0,5'b0,RegDst[1],1'b0,RM);
      defparam MUX4.size_data = 5 ;
        
  regfile U_RF(clk,RS1,RM,RD,WData,RegWr,RD1,RD2);
  a   A1(RD1,clk,A);
  b   B1(RD2,clk,B);
  ext EXT(Imm,ExtOp,Ext);
  mux MUX2(B,Ext,32'b0,32'b0,ALUSelB,1'b0,BS);
      defparam MUX2.size_data = 32 ;
  
  ALU ALU(ALUOp,A,BS,C,Zero);
  aluout ALUOUT1(C,clk,ALUOUT);
  dm_4k U_DM(ALUOUT[11:2],B,MemWr,clk,ReadData);
  DMR DMR(ReadData,clk,R);
  mux MUX3(ALUOUT,R,{Jal_O,2'b00},32'b0,WDSel[0],WDSel[1],WData);
      defparam MUX3.size_data = 32 ;
      
endmodule