module ir(clk,instr,IRWr,op,RS1,RS2,Imm);
input clk; 
input [31:0] instr;
input IRWr;
output [5:0] op;
output [4:0] RS1,RS2;
output [15:0] Imm;

reg [5:0] Op;
reg [4:0] rS1,rS2;
reg [15:0] imm;

assign op=Op;
assign RS1=rS1;
assign RS2=rS2;
assign Imm=imm;

always @ (posedge clk)
begin
  if(IRWr)
    begin
  Op<=instr[31:26];
  rS1<=instr[25:21];
  rS2<=instr[20:16];
  imm<=instr[15:0];
end
else
  begin
    end
    
end

endmodule