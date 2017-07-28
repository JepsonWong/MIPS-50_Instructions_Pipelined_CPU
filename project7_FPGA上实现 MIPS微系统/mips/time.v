module timer(CLK_I,RST_I,ADD_I,WE_I,DAT_I,DAT_O,IRQ);
  input CLK_I,RST_I,WE_I;
  input [3:2] ADD_I;
  input [31:0] DAT_I;
  output [31:0] DAT_O;
  output IRQ;
  
  reg [31:0] regfile[2:0];
  
  assign IRQ=((regfile[0][3]==1'b1)&&(regfile[2]==32'b0)) ? 1:0;
  assign DAT_O= (ADD_I==2'b00) ? regfile[0]:
                (ADD_I==2'b01) ? regfile[1]:
                (ADD_I==2'b10) ? regfile[2]:
                                 32'bx;
  
  
  always @( posedge CLK_I or posedge RST_I)
  begin
    if(RST_I)
      begin
        regfile[0]<=32'b0;
        regfile[1]<=32'b0;
        regfile[2]<=32'b0;
      end
    else
      if(WE_I)
        begin
        case(ADD_I)
          00:regfile[0]<=DAT_I;
          01:begin regfile[1]<=DAT_I;regfile[2]<=DAT_I; end
          default:regfile[0]<=regfile[0];
        endcase
        end
      else
      begin
        regfile[2]<=((regfile[2]!=32'b0)&&(regfile[0][0]==1'b1))? (regfile[2]-1):regfile[2];
        regfile[0][0]<=((regfile[0][0]==1'b1)&&(regfile[2]==32'b0)&&(regfile[1]!=32'b0)&&(regfile[0][2:1]!=2'b01)) ? 0:
                        regfile[0][0];
                        
                 
      end
  end
  
endmodule
  
  