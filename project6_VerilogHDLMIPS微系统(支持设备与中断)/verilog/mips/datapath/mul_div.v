module MUL_DIV(DA,DB,ALUOP,sel,wr,clk,data,H32,L32);
  input signed [31:0] DA,DB;
  input [4:0] ALUOP; 
  input sel,wr,clk;
  input [31:0] data;
  output[31:0] H32,L32;
  
  reg [63:0] M;
  
  assign L32=M[31:0];
  assign H32=M[63:32];
  
  always @ (posedge clk)
  begin
    if(wr)
      begin
        if(sel)
          M[63:32]<=data;
        else
          M[31:0]<=data;
      end
  end
  
  always @ (ALUOP or DA or DB)
  begin
    case(ALUOP)
      5'b10001:M<=DA*DB;
      5'b10010:M<={1'b0,DA}*{1'b0,DB};
      5'b10011:begin M[31:0]<=DA/DB;M[63:32]<=DA%DB; end
      5'b10100:begin M[31:0]<={1'b0,DA}/{1'b0,DB};M[63:32]<={1'b0,DA}%{1'b0,DB}; end
    endcase
  end
  
endmodule