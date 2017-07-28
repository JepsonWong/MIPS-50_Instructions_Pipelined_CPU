module EXE_DM(IntReq_E,IntReq_M,clk,clr,keep,IR,PC4,AO,RD2,RD,IR_O,PC4_O,AO_O,RD2_O,RD_O,rst);
  input clk,clr,keep;
  input rst;
  input [31:0] IR;
  input [31:2] PC4;
  input [31:0] AO,RD2;
  input [4:0] RD;
  output [31:0] IR_O;
  output [31:2] PC4_O;
  output [31:0] AO_O,RD2_O;
  output [4:0] RD_O;
  input IntReq_E;
  output IntReq_M;
  
  reg [31:0] ir;
  reg [31:2] pc4;
  reg [31:0] ao,rd2;
  reg [4:0]  rd;
  reg intreq;
  
  assign IR_O=ir;
  assign PC4_O=pc4;
  assign AO_O=ao;
  assign RD2_O=rd2;
  assign RD_O=rd;
  assign IntReq_M=intreq;
  
  always @ (posedge  clk or posedge rst)
  begin
    if(rst)
      begin
        ir<=32'b0;
        pc4<=30'b0;
        ao<=32'b0;
        rd2<=32'b0;
        rd<=5'b0;
        intreq<=1'b0;
      end
    else
      begin
    if(keep)
      begin
        ir<=IR_O;
        pc4<=PC4_O;
        ao<=AO_O;
        rd2<=RD2_O;
        rd<=RD_O;
        intreq<=IntReq_M;
    end
  else
    if(clr)
      begin
        ir<=32'b0;
        pc4<=30'b0;
        ao<=32'b0;
        rd2<=32'b0;
        rd<=5'b0;
        intreq<=1'b0;
      end
    else
      begin
        ir<=IR;
        pc4<=PC4;
        ao<=AO;
        rd2<=RD2;
        rd<=RD;
        intreq<=IntReq_E;
      end
    end
  end
  
endmodule