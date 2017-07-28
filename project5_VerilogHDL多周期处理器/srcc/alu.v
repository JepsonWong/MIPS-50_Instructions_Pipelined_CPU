module ALU(ALUctr,A,B,C,Zero);
  input [3:0] ALUctr;
  input [31:0] A,B;
  output [31:0] C;
  output [2:0] Zero;
  
  reg [31:0] D;
  integer i;
  
  assign C=D; 
  assign Zero[0]=(D==32'b0)?1:0;
  assign Zero[1]=((D[31]==1'b0)&(D!=32'b0))?1:0;
  assign Zero[2]=((D[31]==1'b1)&(D!=32'b0))?1:0;
  
  always @ (ALUctr or A or B)
  begin
  case(ALUctr)
  4'b0000:D<=A+B;
  4'b0001:D<=A+B;
  4'b0010:D<=A-B;
  4'b0011:D<=A-B;
  4'b0100:D<=A&B;
  4'b0101:D<=A|B;
  4'b0110:D<=A^B;
  4'b0111:D<=~(A|B);
  4'b1000:D<={B[15:0],16'b0};
  4'b1001:begin
  D=A;
  for(i=0;i<B[10:6];i=i+1)
  D=D<<1;
  end                  
  4'b1010:
  begin
    D=A;
    for(i=0;i<B[10:6];i=i+1)
    D=D>>1;
  end           
  4'b1011:
  begin
    D=A;
    for(i=0;i<B[10:6];i=i+1)
    begin
    D=D>>1;
    D[31]=A[31];
  end
  end  
  4'b1100:
  begin
    D=B;
  for(i=0;i<A;i=i+1)
  begin
    D=D<<1;
  end
  end
  4'b1101:
  begin
  D=B;
  for(i=0;i<A;i=i+1)
  begin
    D=D>>1;
  end 
  end
  4'b1110:
  begin
    D=B;
  for(i=0;i<A;i=i+1)
  begin
    D=D>>1;
    D[31]=B[31];
  end 
  end 
  4'b1111:D<=A;                    //{{B{A[32]}},A[32:32'd32-B]};
  default: D<=32'b0;
endcase
end

endmodule 