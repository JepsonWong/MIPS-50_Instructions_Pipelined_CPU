


`include    "D:\\srcc\\head.v"  

module controller(reset,op,funct,regDst,aLUSr,memtoReg,regWrite,memWrite,NPC_sel,extOp,aLUctr);
  input [5:0] op,funct;
  input reset;
  output regDst,aLUSr,memtoReg,regWrite,memWrite,NPC_sel,extOp;
  output [2:0] aLUctr;
  
  reg RegDst,ALUSr,MemtoReg,RegWrite,MemWrite,nPC_sel,ExtOp;
  reg [2:0] ALUctr;
  
  assign regDst=RegDst;
  assign aLUSr=ALUSr;
  assign memtoReg=MemtoReg;
  assign regWrite=RegWrite;
  assign memWrite=MemWrite;
  assign NPC_sel=nPC_sel;
  assign extOp=ExtOp;
  assign aLUctr=ALUctr;
  
  always @ (posedge reset)
  begin
        RegDst<=0;ALUSr<=0;MemtoReg<=0;RegWrite<=0;MemWrite<=0;nPC_sel<=0;ExtOp<=0;ALUctr<=3'b000;
  end
  
  always @ (funct or op)
  begin
  case(op)
    `LW:begin
      RegDst<=0;ALUSr<=1;MemtoReg<=1;RegWrite<=1;MemWrite<=0;nPC_sel<=0;ExtOp<=1;ALUctr<=`add;
    end 
    `SW:begin
      RegDst<=0;ALUSr<=1;MemtoReg<=0;RegWrite<=0;MemWrite<=1;nPC_sel<=0;ExtOp<=1;ALUctr<=`add;
    end
    `BEQ:begin
      RegDst<=0;ALUSr<=0;MemtoReg<=0;RegWrite<=0;MemWrite<=0;nPC_sel<=1;ExtOp<=0;ALUctr<=`sub;
    end
    `LUI:begin
      RegDst<=0;ALUSr<=1;MemtoReg<=0;RegWrite<=1;MemWrite<=0;nPC_sel<=0;ExtOp<=0;ALUctr<=`lui;
    end
    `ORI:begin
      RegDst<=0;ALUSr<=1;MemtoReg<=0;RegWrite<=1;MemWrite<=0;nPC_sel<=0;ExtOp<=0;ALUctr<=`ori;
    end
    `R: begin case(funct)
        `ADDU:begin
          RegDst<=1;ALUSr<=0;MemtoReg<=0;RegWrite<=1;MemWrite<=0;nPC_sel<=0;ExtOp<=0;ALUctr<=`add;
        end
        `SUBU:begin
          RegDst<=1;ALUSr<=0;MemtoReg<=0;RegWrite<=1;MemWrite<=0;nPC_sel<=0;ExtOp<=0;ALUctr<=`sub;
        end
      endcase
      end
      endcase
      end
endmodule
