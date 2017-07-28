module ID_EXE(IntReq_D,IntReq_E,clk,clr,keep,IR,PC,PC4,RD1,RD2,EXT,IR_O,PC4_O,RD1_O,RD2_O,EXT_O,rst);
  input  clk,clr,keep;
  input rst;
  input [31:0] IR;
  input [31:2] PC,PC4;
  input [31:0] RD1,RD2,EXT;
  output [31:0] IR_O;
  output [31:2] PC4_O;
  output [31:0] RD1_O,RD2_O,EXT_O;
  input IntReq_D;
  output IntReq_E;
  
  
reg [31:0] ir;
  
reg [31:2] pc4;
  
reg [31:0] rd1,rd2,ext;
reg intreq;
 
 assign IR_O=ir;
 assign PC4_O=pc4;
 assign RD1_O=rd1;
 assign RD2_O=rd2;
 assign EXT_O=ext;
 assign IntReq_E=intreq;
  
  
always @ (posedge clk or posedge rst)
  
begin
  if(rst)
    begin
      ir<=32'b0;
  
      pc4<=30'b0;
  
      rd1<=32'b0;
  
      rd2<=32'b0;
  
      ext<=32'b0;
      intreq<=1'b0;
    end
  
else
  if(keep)
  
    begin
    ir<=IR_O;
    pc4<=PC4_O;
    rd1<=RD1_O;
    rd2<=RD2_O;
    ext<=EXT_O;
    intreq<=IntReq_E;
    end
  else
    if(clr)
    begin
    ir<=32'b0;
    pc4<=30'b0;
    rd1<=32'b0;
    rd2<=32'b0;
    ext<=32'b0;
    intreq<=1'b0;
    end

            else

              begin

                ir<=IR;

                pc4<=PC4;

                rd1<=RD1;

                rd2<=RD2;

                ext<=EXT;
                intreq<=IntReq_D;

                end

  end

  
endmodule