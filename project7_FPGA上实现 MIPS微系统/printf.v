`include    "D:\\srcc\\head.v"  
module printf(clk,reset,DIN,DOU,sel);
  input clk;
  input reset;
  input [31:0] DIN;
  output [7:0] DOU;
  output [7:0] sel;
  
  reg [31:0] M;
  reg [2:0] state;
  reg [3:0] dout;
  reg [7:0] d;
  reg [7:0] s;
  
  assign DOU=d;
  assign sel=s;
  
  always @ (DIN)
  begin
    M<=DIN;
  end
  
  always @ (posedge clk )
  begin
    if(reset)
    begin
    state<=3'b000;
    end
  else
    case(state)
      3'b000:state<=3'b001;
      3'b001:state<=3'b010;
      3'b010:state<=3'b011;
      3'b011:state<=3'b100;
      3'b100:state<=3'b101;
      3'b101:state<=3'b110;
      3'b110:state<=3'b111;
      3'b111:state<=3'b000;
      default:state<=3'b000;
    endcase
  end
  
  
always @ (state)
  
begin
  
  case(state)
  
    3'b000:begin dout<=M[3:0]; s<=8'b10000000;end
  
    3'b001:begin dout<=M[7:4]; s<=8'b01000000;end
  
    3'b010:begin dout<=M[11:8]; s<=8'b00100000;end
  
    3'b011:begin dout<=M[15:12]; s<=8'b00010000;end
  
    3'b100:begin dout<=M[19:16]; s<=8'b00001000;end
  
    3'b101:begin  dout<=M[23:20]; s<=8'b00000100;end
  
    3'b110:begin dout<=M[27:24]; s<=8'b00000010;end
  
    3'b111:begin dout<=M[31:28]; s<=8'b00000001;end
    endcase

  end
  
  always @ (dout)
  begin
    case(dout)
      4'b0000:d<=`_0;
      4'b0001:d<=`_1;
      4'b0010:d<=`_2;
      4'b0011:d<=`_3;
      4'b0100:d<=`_4;
      4'b0101:d<=`_5;
      4'b0110:d<=`_6;
      4'b0111:d<=`_7;
      4'b1000:d<=`_8;
      4'b1001:d<=`_9;
      4'b1010:d<=`A;
      4'b1011:d<=`B;
      4'b1100:d<=`C;
      4'b1101:d<=`D;
      4'b1110:d<=`E;
      4'b1111:d<=`F;
    endcase
  end
  
endmodule