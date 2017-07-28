module  CP0(PC,DIn,HWInt,Sel,Wen,EPCWr,EXLSet,EXLClr,clk,rst,IntReq,EPC,DOut);
  input [31:2] PC;
  input [31:0] DIn;
  input [5:0] HWInt;
  input [4:0] Sel;
  input Wen,EPCWr;
  input EXLSet;
  input EXLClr;
  input clk;
  input rst;
  output IntReq;
  output [31:2] EPC;
  output [31:0] DOut;
  
  reg [31:0] regfile [3:0];
  
  assign EPC=regfile[2][31:2];
  assign DOut=(Sel==5'b01100) ? regfile[0]:
              (Sel==5'b01101) ? regfile[1]:
              (Sel==5'b01110) ? regfile[2]:
              (Sel==5'b01111) ? regfile[3]:
              32'bz;
  assign IntReq=((HWInt&regfile[0][15:10])!=6'b000000)&regfile[0][0]&(~regfile[0][1]);//~
  
  always @ (posedge clk or posedge rst)
  begin
    if(rst)
      begin
      regfile[0][0]<=1'b1;
      regfile[0][1]<=1'b0;
      regfile[0][9:2]<=8'b0;
      regfile[0][15:10]<=6'b111111;
      regfile[0][31:16]<=16'b0;
      regfile[1][15:10]<=6'b0;
      regfile[1][9:0]<=10'b0;
      regfile[1][31:16]<=16'b0;
      regfile[2]<=32'b0;
      regfile[3]<=32'b0;
      end
    else
      begin
        if(Wen)
        begin
        case(Sel)
          5'b01100:begin regfile[0][0]<=DIn[0];regfile[0][1]<=DIn[1];regfile[0][15:10]<=DIn[15:10];end
          5'b01101:regfile[1][15:10]<=DIn[15:10];
          5'b01110:regfile[2]<=DIn;
          5'b01111:regfile[3]<=DIn;
          endcase
        end
        
        if(EXLSet)
        regfile[0][1]<=1'b1;
        if(EXLClr)
        regfile[0][1]<=1'b0;
        if(EPCWr)
        regfile[2]<={PC,2'b00};
 
        regfile[1][15:10]<=HWInt[5:0];
      end
  end
  
endmodule
  