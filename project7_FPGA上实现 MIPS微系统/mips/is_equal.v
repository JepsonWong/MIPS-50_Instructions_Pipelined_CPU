module is_equal(A,B,IS_EQUAL);
  
  input [31:0] A,B;
  output [2:0] IS_EQUAL;
  
  reg [31:0] D;
  
  assign IS_EQUAL[0]=(A==B)? 1:0;
  assign IS_EQUAL[1]=((D[31]==1'b0)&(D!=32'b0))?1:0;
  assign IS_EQUAL[2]=((D[31]==1'b1)&(D!=32'b0))?1:0;
  
  always @(A or B)
  begin
    D<=A-B;
 
 end 
  

endmodule