




module mips(clk,reset);
  input clk;
  input reset;
  
  wire [31:0] instr;
  wire RegDst;
  wire ALUSr;
  wire MemtoReg;
  wire RegWrite;
  wire MemWrite;
  wire nPC_sel;
  wire ExtOp;
  wire [2:0] ALUct;
    
  controller CONTROLLER(reset,instr[31:26],instr[5:0],RegDst,ALUSr,MemtoReg,RegWrite,MemWrite,nPC_sel,ExtOp,ALUct);
  datapath DATAPATH(clk,reset,instr,RegDst,ALUSr,MemtoReg,RegWrite,MemWrite,nPC_sel,ExtOp,ALUct);
  
endmodule
