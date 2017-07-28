module mips(clk,rst,PrAddr,BE,PrDIn,PrDOut,Wen,HWInt);
  input clk,rst;
  output [31:2] PrAddr;
  output [3:0] BE;
  input [31:0] PrDIn;
  output [31:0] PrDOut;
  output Wen;
  input [7:2] HWInt;
  
  wire PCWr_F;
  wire nPCOP_F;
  wire [31:2] pC_F,nPC_F,pC4_F;
  wire [31:0] IR_F;
  
  wire JALR_D;
  wire BEQ_D;
  wire MTC0_D;
  wire EXTOP_D;
  wire [2:0] NPCOP_D;
  wire CP0_Wen_D;
  wire EPCWr_D,EXLSet_D,EXLClr_D;/////////
  wire [31:2] EPC_D;/////////
  wire [31:0] DOut_D;
  wire [31:2] PC_D,PC4_D,NPC_D;
  wire [31:0] RD1_D,RD2_D; 
  wire [31:0] IR_D;
  wire [31:0] EXT_D;
  wire [2:0] IS_EQUAL_D;
  wire [31:0] RD1_SEL_D,RD2_SEL_D;
  
  wire JAL_E,JALR_E,BEQ_E,LW_E,R_E,I_E,SW_E;
  wire [4:0]  ALUctr_E;
  wire A2OP_E;
  wire B2OP_E;
  wire [1:0] RegDst_E;
  wire [2:0] WDSel_E;
  wire MUL_DIV_Sel_E,MUL_DIV_Wr_E;
  wire [31:0] DOut_E;
  wire [31:0] IR_E;
  wire [31:2] PC4_E;
  wire [31:0] RD1_E,RD2_E,EXT_E;
  wire [31:0] A_E,B_E,A1_E,B1_E,C_E,C_END_E;
  wire [31:0] H32_E,L32_E;
  wire [2:0] Zero_E;
  wire [4:0] RD_E;
  
  wire JAL_M,JALR_M,BEQ_M,LW_M,R_M,I_M,SW_M;
  wire [7:0] WHB_M;
  wire MEMWR_M;
  wire DM_Sel_M;
  wire [31:0] IR_M;
  wire [31:2] PC4_M;
  wire [31:0] C_M,B_M;
  wire [4:0] RD_M;
  wire [3:0] be_M;
  wire [31:0] ReadData_M,READDATA_M;
  wire [31:0] EXT_M;
  
  wire JAL_W,JALR_W,BEQ_W,LW_W,R_W,I_W,SW_W;
  wire RegWr_W;
  wire [1:0] WDSel_W;
  wire [31:0] IR_W;
  wire [31:2] PC4_W;
  wire [31:0] AO_W,DR_W;
  wire [4:0] RD_W;
  wire [31:0] WDATA_W;
  
  wire clr_IF_ID,keep_IF_ID;
  wire clr_ID_EXE,keep_ID_EXE;
  wire clr_EXE_DM,keep_EXE_DM;
  wire clr_DM_WR,keep_DM_WR;
  wire [1:0] RD1OP_D,RD2OP_D;
  wire [1:0] A1OP_E,B1OP_E;
  
  wire IntReq_D,IntReq_M,IntReq_E,IntReq_W;
  
  assign BE=be_M;
  assign PrAddr=C_M[31:2];
  assign PrDOut=((WHB_M[0]==1'b1)|(WHB_M[1]==1'b1)|(WHB_M[2]==1'b1)) ? B_M:32'hx;
  assign Wen=((C_M>=32'h00007F00)&((WHB_M[0]==1'b1)|(WHB_M[1]==1'b1)|(WHB_M[2]==1'b1))) ? 1:0;
  
  control U_control(IntReq_D,IntReq_M,IntReq_E,IntReq_W,NPCOP_D,JALR_D,BEQ_D,MTC0_D,JAL_E,JALR_E,BEQ_E,LW_E,R_E,I_E,SW_E,JAL_M,JALR_M,BEQ_M,LW_M,R_M,I_M,SW_M,JAL_W,JALR_W,BEQ_W,LW_W,R_W,I_W,SW_W,clr_IF_ID,keep_IF_ID,clr_ID_EXE,keep_ID_EXE,clr_EXE_DM,keep_EXE_DM,clr_DM_WR,keep_DM_WR,RD1OP_D,RD2OP_D,A1OP_E,B1OP_E,PCWr_F,IR_D[25:21],IR_D[20:16],IR_E[25:21],IR_E[20:16],RD_E,RD_M,RD_W);
  
   ID_CTRL U_ID_CTRL(rst,NPCOP_D,nPCOP_F);
   mux2 MUX23(pC4_F,NPC_D,nPCOP_F,nPC_F);
   defparam MUX23.size_data = 30;
   PC  U_PC(clk,rst,PCWr_F,nPC_F,pC_F);
   im_4k U_im_4k(pC_F,IR_F);
   add4 U_ADD4(pC_F,pC4_F);
   
   IF_ID U_IF_ID(clk,clr_IF_ID,keep_IF_ID,pC_F,pC4_F,IR_F,PC_D,PC4_D,IR_D,rst);
   
   CP0 U_cp0(pC_F,RD2_SEL_D,HWInt,IR_D[15:11],CP0_Wen_D,EPCWr_D,EXLSet_D,EXLClr_D,clk,rst,IntReq_D,EPC_D,DOut_D);
   regfile U_regfile(clk,rst,IR_D[25:21],IR_D[20:16],RD_W,WDATA_W,RegWr_W,RD1_D,RD2_D);
   ext U_EXT(IR_D[15:0],EXTOP_D,EXT_D);
   NPC U_NPC(NPCOP_D,IR_D,RD1_SEL_D,PC_D,NPC_D,EPC_D);
   is_equal U_is_equal(RD1_SEL_D,RD2_SEL_D,IS_EQUAL_D);
   IF_CTRL U_IF_CTRL(IntReq_W,IR_D[31:26],IR_D[5:0],IR_D[20:16],IR_D[25:21],IS_EQUAL_D,NPCOP_D,EXTOP_D,JALR_D,BEQ_D,MTC0_D,CP0_Wen_D,EXLClr_D,EPCWr_D,EXLSet_D);
   mux4 MUX42(RD1_D,WDATA_W,C_M,C_END_E,RD1OP_D,RD1_SEL_D);
   defparam MUX42.size_data = 32;
   mux4 MUX43(RD2_D,WDATA_W,C_M,C_END_E,RD2OP_D,RD2_SEL_D);
   defparam MUX43.size_data = 32;
   
   ID_EXE U_ID_EXE(IntReq_D,IntReq_E,clk,clr_ID_EXE,keep_ID_EXE,IR_D,PC_D,PC4_D,RD1_SEL_D,RD2_SEL_D,EXT_D,IR_E,PC4_E,RD1_E,RD2_E,EXT_E,rst);
   //IntReq IntReq1(IntReq_D,clk,rst,IntReq_E);
   register U_register(DOut_D,DOut_E,clk,rst);
   
   EXE_CTRL U_EXE_CTRL(IR_E[31:26],IR_E[5:0],IR_E[20:16],IR_E[25:21],ALUctr_E,A2OP_E,B2OP_E,RegDst_E,WDSel_E,MUL_DIV_Sel_E,MUL_DIV_Wr_E,JAL_E,JALR_E,BEQ_E,LW_E,R_E,I_E,SW_E);
   mux4 MUX44(RD1_E,C_M,WDATA_W,32'b0,A1OP_E,A1_E);
   defparam MUX44.size_data = 32;
   mux4 MUX45(RD2_E,C_M,WDATA_W,32'b0,B1OP_E,B1_E);
   defparam MUX45.size_data = 32;
   mux2 MUX22(A1_E,B1_E,A2OP_E,A_E);
   defparam MUX22.size_data = 32;
   mux2 MUX21(B1_E,EXT_E,B2OP_E,B_E);
   defparam MUX21.size_data = 32;
   ALU U_ALU(ALUctr_E,A_E,B_E,C_E,Zero_E);
   MUL_DIV U_MUL_DIV(A1_E,B1_E,ALUctr_E,MUL_DIV_Sel_E,MUL_DIV_Wr_E,clk,A1_E,H32_E,L32_E);
   mux4 MUX46(IR_E[20:16],IR_E[15:11],5'b11111,5'b0,RegDst_E,RD_E);
   defparam MUX46.size_data = 5;
   mux8 MUX87(C_E,{31'b0,Zero_E[2]},L32_E,H32_E,{PC4_E,2'b00},DOut_E,32'b0,32'b0,WDSel_E,C_END_E);
   defparam MUX87.size_data = 32;
   
   EXE_DM U_EXE_DM(IntReq_E,IntReq_M,clk,clr_EXE_DM,keep_EXE_DM,IR_E,PC4_E,C_END_E,B1_E,RD_E,IR_M,PC4_M,C_M,B_M,RD_M,rst);
   //IntReq IntReq2(IntReq_E,clk,rst,IntReq_M);
   
   DM_CTRL U_DM_CTRL(IR_M[31:26],IR_M[5:0],IR_M[20:16],IR_M[25:21],WHB_M,MEMWR_M,JAL_M,JALR_M,BEQ_M,LW_M,R_M,I_M,SW_M,C_M,DM_Sel_M);
   BE U_BE(C_M[1:0],WHB_M,be_M);
   dm_4k U_dm_4k(C_M[11:2],B_M,MEMWR_M,clk,be_M,ReadData_M);
   mux2 MUX24(ReadData_M,PrDIn,DM_Sel_M,READDATA_M);//
      defparam MUX24.size_data = 32;
   data_ext U_data_ext(READDATA_M,be_M,WHB_M,EXT_M);
   
   DM_WR U_DM_WR(IntReq_M,IntReq_W,clk,clr_DM_WR,keep_DM_WR,IR_M,PC4_M,C_M,EXT_M,RD_M,IR_W,PC4_W,AO_W,DR_W,RD_W,rst);
   //IntReq IntReq3(IntReq_M,clk,rst,IntReq_W);
   
   WR_CTRL U_WR_CTRL(IR_W[31:26],IR_W[5:0],IR_W[20:16],IR_W[25:21],WDSel_W,RegWr_W,JAL_W,JALR_W,BEQ_W,LW_W,R_W,I_W,SW_W);
   mux4 MUX48(AO_W,DR_W,{PC4_W,2'b00},32'b0,WDSel_W,WDATA_W);
   defparam MUX48.size_data = 32;
   
endmodule