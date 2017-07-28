module BE (aluout,whb,be);
  input [1:0] aluout;
  inout [7:0] whb;
  output [3:0] be;
  
  reg [3:0] b;
  
  assign be=b;
  
  always @ (aluout or  whb)
  begin
    if((whb[0]==1)|(whb[3]==1)) b<=4'b1111;
    else
      if((whb[1]==1)|(whb[4]==1)|(whb[5]==1))
        if(aluout[1]==1'b0) b<=4'b0011;
        else b<=4'b1100;
      else
        if(aluout==2'b00) b<=4'b0001;
        else
          if(aluout==2'b01) b<=4'b0010;
          else
            if(aluout==2'b10) b<=4'b0100;
            else b<=4'b1000;
  end

endmodule