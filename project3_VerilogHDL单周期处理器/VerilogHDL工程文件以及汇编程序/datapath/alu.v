




module ALU(ALUctr[2:0],A[31:0],B[31:0],C[31:0],Zero);
  input [2:0] ALUctr;
  input [31:0] A,B;
  output [31:0] C;
  output Zero;
  
  reg [31:0] D;
  reg [31:0] rd;
  wire [31:0] m;
  
  adder ADDER(A,rd,m);
  
  assign C=((ALUctr==3'b000)|(ALUctr==3'b001))? m:D; 
  assign Zero=(C==32'b0)?1:0;
  
  always @ (ALUctr or A or B)
  case(ALUctr)
  3'b000:rd<=B;
  3'b001:rd<=~B+1;
  3'b010:D<=A|B;
  3'b011:D<={B[15:0],16'b0};
  default: D<=32'b0;
endcase

module adder(A,B,C);
  input [31:0] A,B;
  output [31:0] C;
  assign C=A+B;
endmodule
endmodule 