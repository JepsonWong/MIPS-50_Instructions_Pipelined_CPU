module IF_ID(clk,clr,keep,PC,PC4,IR,PC_O,PC4_O,IR_O,rst);
  
  input clk;
  input clr;
  input keep;
  input rst;
  input [31:2] PC;
  input [31:2] PC4;
  input [31:0] IR;
  output [31:2] PC_O;
  output [31:2] PC4_O;
  output [31:0] IR_O;
  
  reg [31:2] pc;
  reg [31:2] pc4;
  reg [31:0] ir;
  
assign PC_O=pc;
assign PC4_O=pc4;
assign IR_O=ir;
  
  always @ (posedge clk or posedge rst)
  begin
    if(rst)
      begin
        pc<=30'b0;
        pc4<=30'b0;
        ir<=32'b0;
      end
    else
    if(keep)
      begin
        pc<=PC_O;
        pc4<=PC4_O;
        ir<=IR_O;
      end
    else
      if(clr)
        begin
         pc<=30'b0;
         pc4<=30'b0;
         ir<=32'b0;
        end
      else
       begin
       pc<=PC;
       
pc4<=PC4;
       
ir<=IR;
    end
  end
  
endmodule