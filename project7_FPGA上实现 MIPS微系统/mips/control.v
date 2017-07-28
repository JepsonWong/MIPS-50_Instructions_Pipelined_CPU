module control(IntReq_D,IntReq_M,IntReq_E,IntReq_W,NPCOP_D,JALR_D,BEQ_D,MTC0_D,JAL_E,JALR_E,BEQ_E,LW_E,R_E,I_E,SW_E,JAL_M,JALR_M,BEQ_M,LW_M,R_M,I_M,SW_M,JAL_W,JALR_W,BEQ_W,LW_W,R_W,I_W,SW_W,clr_IF_ID,keep_IF_ID,clr_ID_EXE,keep_ID_EXE,clr_EXE_DM,keep_EXE_DM,clr_DM_WR,keep_DM_WR,RD1OP_D,RD2OP_D,A1OP_E,B1OP_E,PCWr_F,RS_D,RT_D,RS_E,RT_E,RD_E,RD_M,RD_W);
  
  input [2:0] NPCOP_D;
  input IntReq_D,IntReq_M,IntReq_E,IntReq_W;
  input JALR_D,BEQ_D,MTC0_D,JAL_E,JALR_E,BEQ_E,LW_E,R_E,I_E,SW_E,JAL_M,JALR_M,BEQ_M,LW_M,R_M,I_M,SW_M,JAL_W,JALR_W,BEQ_W,LW_W,R_W,I_W,SW_W;
  output clr_IF_ID,keep_IF_ID,clr_ID_EXE,keep_ID_EXE,clr_EXE_DM,keep_EXE_DM,clr_DM_WR,keep_DM_WR;
  output [1:0] RD1OP_D,RD2OP_D,A1OP_E,B1OP_E;
  output PCWr_F;
  input [4:0] RS_D,RT_D,RS_E,RT_E,RD_E,RD_M,RD_W;
  
  reg keep_if_id,keep_id_exe,PCWr_f;
  reg clr_if_id,clr_id_exe,clr_exe_dm,keep_exe_dm,clr_dm_wr,keep_dm_wr;
  
  //assign keep_if_id=((JALR_D)&&(RS_D==RD_E)&&(LW_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(LW_E));
  //assign keep_id_exe=(R_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(I_E&&LW_M&&(RS_E==RD_M))|(LW_E&&LW_M&&(RS_E==RD_M))|(SW_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(JALR_D&&(RS_D==RD_E)&&LW_M)|(BEQ_D&&((RS_D==RD_E)|(RT_D==RD_E))&&LW_M);
  assign keep_IF_ID=keep_if_id;
  assign clr_IF_ID=clr_if_id;
  assign clr_ID_EXE=clr_id_exe;
  assign clr_EXE_DM=clr_exe_dm;
  assign keep_EXE_DM=keep_exe_dm;
  assign clr_DM_WR=clr_dm_wr;
  assign keep_DM_WR=keep_dm_wr;
  assign PCWr_F=PCWr_f;
  assign keep_ID_EXE=keep_id_exe;
  assign RD1OP_D=(RS_D==5'b00000) ? 2'b00:
                 ((JALR_D|BEQ_D)&&(RS_D==RD_M)) ? 2'b10:
                 ((JALR_D|BEQ_D)&&(RS_D==RD_W)) ? 2'b01:
                 ((JALR_D|BEQ_D)&&(RS_D==RD_E)) ? 2'b11:
                 2'b00;
  assign RD2OP_D=(RT_D==5'b00000) ? 2'b00:
                 ((BEQ_D|MTC0_D)&&(RT_D==RD_M)) ? 2'b10:
                 ((BEQ_D|MTC0_D)&&(RT_D==RD_W)) ? 2'b01:
                 ((BEQ_D|MTC0_D)&&(RT_D==RD_E)) ? 2'b11:
                 2'b00;
  assign A1OP_E=(RS_E==5'b00000) ? 2'b00:
                ((R_E|LW_E|I_E|SW_E)&&(RS_E==RD_M)) ? 2'b01:
                ((R_E|LW_E|I_E|SW_E)&&(RS_E==RD_W)) ? 2'b10:
                 2'b00;
  assign B1OP_E=(RT_E==5'b00000) ? 2'b00:
                ((R_E|SW_E)&&(RT_E==RD_M)) ? 2'b01:
                 ((R_E|SW_E)&&(RT_E==RD_W)) ? 2'b10:
                 2'b00; 
   
  always @ (IntReq_E or IntReq_M or JALR_D or BEQ_D or MTC0_D or JAL_E or JALR_E or BEQ_E or LW_E or R_E or I_E or SW_E or JAL_M or JALR_M or BEQ_M or LW_M or R_M or I_M or SW_M or JAL_W  or JALR_W or BEQ_W or LW_W or R_W or I_W or SW_W or RS_D  or RT_D or RS_E or RT_E or RD_E or RD_M or RD_W)
  begin
    //keep_if_id<=((JALR_D)&&(RS_D==RD_E)&&(LW_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(LW_E))|(MTC0_D&&(RT_D==RD_E)&&LW_E)|(JALR_D&&(RS_D==RD_M)&&LW_M)|(BEQ_D&&((RS_D==RD_M)|(RT_D==RD_M))&&LW_M)|(MTC0_D&&(RT_D==RD_M)&&LW_M);  
    //(JALR_D&&(RS_D==RD_E)&&(R_E|I_E|JAL_E|JALR_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(R_E|I_E|JAL_E|JALR_E));
    keep_id_exe<=(R_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(I_E&&LW_M&&(RS_E==RD_M))|(LW_E&&LW_M&&(RS_E==RD_M))|(SW_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)));
   // PCWr_f<=((JALR_D)&&(RS_D==RD_E)&&(LW_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(LW_E))|(R_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(I_E&&LW_M&&(RS_E==RD_M))|(LW_E&&LW_M&&(RS_E==RD_M))|(SW_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(JALR_D&&(RS_D==RD_M)&&LW_M)|(BEQ_D&&((RS_D==RD_M)|(RT_D==RD_M))&&LW_M)|(MTC0_D&&(RT_D==RD_E)&&LW_E)|(MTC0_D&&(RT_D==RD_M)&&LW_M)|(IntReq_E|IntReq_M) ? 0:1;
    
  end
              
  always @ (keep_id_exe or IntReq_W or IntReq_M  or IntReq_E or IntReq_D or NPCOP_D or JALR_D or BEQ_D or MTC0_D or JAL_E or JALR_E or BEQ_E or LW_E or R_E or I_E or SW_E or JAL_M or JALR_M or BEQ_M or LW_M or R_M or I_M or SW_M or JAL_W  or JALR_W or BEQ_W or LW_W or R_W or I_W or SW_W or RS_D  or RT_D or RS_E or RT_E or RD_E or RD_M or RD_W)
  begin
    keep_if_id<=((JALR_D)&&(RS_D==RD_E)&&(LW_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(LW_E))|(MTC0_D&&(RT_D==RD_E)&&LW_E)|(JALR_D&&(RS_D==RD_M)&&LW_M)|(BEQ_D&&((RS_D==RD_M)|(RT_D==RD_M))&&LW_M)|(MTC0_D&&(RT_D==RD_M)&&LW_M)|keep_id_exe;  
    //(JALR_D&&(RS_D==RD_E)&&(R_E|I_E|JAL_E|JALR_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(R_E|I_E|JAL_E|JALR_E));
    
    PCWr_f<=((JALR_D)&&(RS_D==RD_E)&&(LW_E))|((BEQ_D)&&((RS_D==RD_E)|(RT_D==RD_E))&&(LW_E))|(R_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(I_E&&LW_M&&(RS_E==RD_M))|(LW_E&&LW_M&&(RS_E==RD_M))|(SW_E&&LW_M&&((RS_E==RD_M)|(RT_E==RD_M)))|(JALR_D&&(RS_D==RD_M)&&LW_M)|(BEQ_D&&((RS_D==RD_M)|(RT_D==RD_M))&&LW_M)|(MTC0_D&&(RT_D==RD_E)&&LW_E)|(MTC0_D&&(RT_D==RD_M)&&LW_M)|(IntReq_E|IntReq_M) ? 0:1;

    keep_exe_dm<=0;
    keep_dm_wr<=0;
    //clr_if_id<=(NPCOP_D!=3'b000) ? 1:0;
    if(IntReq_W)
      clr_dm_wr<=1;
    else
      clr_dm_wr<=0;
    if(IntReq_D|(NPCOP_D!=3'b000)|IntReq_E|IntReq_M|IntReq_W)
      clr_if_id<=1;
    else
      clr_if_id<=0;
    if(IntReq_E|IntReq_M|IntReq_W|keep_if_id)
      clr_id_exe<=1;
    else
      clr_id_exe<=0;
    if(IntReq_M|IntReq_W|keep_id_exe)
      clr_exe_dm<=1;
    else
      clr_exe_dm<=0;
    if(keep_id_exe)
      begin
        //keep_if_id<=1;
        //clr_exe_dm<=1;
        //clr_id_exe<=0;
        //PCWr_f<=0;
      end
    else
      if(keep_if_id)
        begin
          //clr_id_exe<=1;
          //clr_exe_dm<=0;
          //PCWr_f<=0;
        end
      else
        begin
          //clr_exe_dm<=0;
          //clr_id_exe<=0;
        end
        //PCWr_f<=1;
  end
  
endmodule