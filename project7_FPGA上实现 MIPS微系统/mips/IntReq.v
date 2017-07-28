module IntReq(DM,clk,rst,R);
  input DM;
  input clk;
  input rst;
  output R;
  
  reg r;
  
  assign R=r;
  
  always @ (posedge clk or posedge rst)
  begin
    if(rst)
      r=1'b0;
    else
      r<=DM;
  end
  
endmodule