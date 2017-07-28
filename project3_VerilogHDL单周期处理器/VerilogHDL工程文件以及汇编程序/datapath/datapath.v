




module datapath(clk,reset,instr,RegDst,ALUSr,MemtoReg,RegWrite,MemWrite,nPC_sel,ExtOp,ALUct);
  input clk;
  input reset;
  output [31:0] instr;
  input RegDst,ALUSr,MemtoReg,RegWrite,MemWrite,nPC_sel,ExtOp;
  input [2:0]ALUct;
  
  wire Zero;
  wire [31:2] nPC;
  wire [31:2] pC;
  wire [4:0] RD;
  wire [31:0] WData;
  wire [31:0] RD1,RD2;
  wire [31:0] Ext;
  wire [31:0] B,C;
  wire [31:0] ReadData;
  
  
  NPC npc(instr[15:0],nPC_sel,Zero,pC,nPC);
  PC  pc(clk,reset,nPC,pC);
  im_4k IM_4K(pC[11:2],instr);
  mux MUX1(instr[20:16],instr[15:11],5'b0,5'b0,RegDst,1'b0,RD);
      defparam MUX1.size_data = 5 ;
    
  regfile REGFILE(clk,instr[25:21],instr[20:16],RD,WData,RegWrite,RD1,RD2);
  ext EXT(instr[15:0],ExtOp,Ext);
  mux MUX2(RD2,Ext,32'b0,32'b0,ALUSr,1'b0,B);
      defparam MUX2.size_data = 32 ;
  
  ALU ALU(ALUct,RD1,B,C,Zero);
  dm_4k DM_4K(C[11:2],RD2,MemWrite,clk,ReadData);
  mux MUX3(C,ReadData,32'b0,32'b0,MemtoReg,1'b0,WData);
      defparam MUX3.size_data = 32 ;
      
endmodule