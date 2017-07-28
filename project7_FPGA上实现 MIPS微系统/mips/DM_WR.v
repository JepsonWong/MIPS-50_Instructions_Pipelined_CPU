module DM_WR(IntReq_M,IntReq_W,clk,clr,keep,IR,PC4,AO,DR,RD,IR_O,PC4_O,AO_O,DR_O,RD_O,rst);
  
  input clk,clr,keep;
  input rst;
  input [31:0] IR;
  input [31:2] PC4;
  input [31:0] AO,DR;
  input [4:0] RD;
  output [4:0] RD_O;
  output [31:0] IR_O;
  output [31:2] PC4_O;
  output [31:0] AO_O,DR_O;
  input IntReq_M;
  output IntReq_W;
  
  reg [31:0] ir;
  reg [31:2] pc4;
  reg [31:0] ao,dr;
  reg [4:0] rd;
  reg intreq;
  
  assign IntReq_W=intreq;
  assign IR_O=ir;
  assign PC4_O=pc4;
  assign AO_O=ao;
  assign DR_O=dr;
  assign RD_O=rd;
  
  always @ (posedge clk or posedge rst)
  begin
    if(rst)
      begin
        ir<=32'b0;
        pc4<=30'b0;
        ao<=32'b0;
        dr<=32'b0;  
        rd<=5'b0; 
        intreq<=1'b0;
      end
    else
    if(keep)
      begin
        ir<=IR_O;
        pc4<=PC4_O;
        ao<=AO_O;
        dr<=DR_O;
        rd<=RD_O;
        intreq<=IntReq_W;
      end
    else
      if(clr)
        begin
        ir<=32'b0;
        pc4<=30'b0;
        ao<=32'b0;
        dr<=32'b0;  
        rd<=5'b0;  
        intreq<=1'b0;
        end
      else
        begin
        ir<=IR;
        pc4<=PC4;
        ao<=AO;
        dr<=DR; 
        rd<=RD;
        intreq<=IntReq_M;
        end
  end
  
endmodule