`include    "D:\\srcc\\head.v"  
module segment(clk,reset,DIN,address,WE,DOUT_P_1,DOUT_P_2,DOUT,sel);
  
  input clk;
  input reset;
  
  input [31:0] DIN;
  input address;
  input WE;
  output [7:0] DOUT_P_1,DOUT_P_2;
  output [31:0] DOUT;
  output [7:0] sel;
  
  reg [31:0] M;
  reg [1:0] state;
  reg [3:0] dout_1,dout_2;
  reg [7:0] d1,d2;
  reg [7:0] s;
  
  assign DOUT_P_1=d1;
  assign DOUT_P_2=d2;
  
assign sel=s;
  
assign DOUT=(address)?M:32'bx;
  
  always @ (DIN or WE or address)
  begin
    if(WE&address)
     M<=DIN;
  end
  
  always @ (posedge clk or posedge reset or posedge WE)
  begin
    if(reset)
      begin
    state<=2'bxx;
  end
  else
    if(WE)
      state<=2'b00;
    else
      begin
    case(state)
      2'b00:state<=2'b01;
      2'b01:state<=2'b10;
      2'b10:state<=2'b11;
      2'b11:state<=2'b00;
    endcase
  end
  end
  
  
always @ (state)
  
begin
  
  case(state)
  
    2'b00:begin dout_1<=M[3:0]; dout_2<=M[19:16];s<=8'b10001000;end
  
    2'b01:begin dout_1<=M[7:4]; dout_2<=M[23:20];s<=8'b01000100;end
  
    2'b10:begin dout_1<=M[11:8]; dout_2<=M[27:24];s<=8'b00100010;end
  
    2'b11:begin dout_1<=M[15:12];dout_2<=M[31:28]; s<=8'b00010001;end
  
    endcase

  end
  
  always @ (dout_1)
  begin
    case(dout_1)
      4'b0000:d1<=`_0;
      4'b0001:d1<=`_1;
      4'b0010:d1<=`_2;
      4'b0011:d1<=`_3;
      4'b0100:d1<=`_4;
      4'b0101:d1<=`_5;
      4'b0110:d1<=`_6;
      4'b0111:d1<=`_7;
      4'b1000:d1<=`_8;
      4'b1001:d1<=`_9;
      4'b1010:d1<=`A;
      4'b1011:d1<=`B;
      4'b1100:d1<=`C;
      4'b1101:d1<=`D;
      4'b1110:d1<=`E;
      4'b1111:d1<=`F;
    endcase
  end
  
   always @ (dout_2)
  begin
    case(dout_2)
      4'b0000:d2<=`_0;
      4'b0001:d2<=`_1;
      4'b0010:d2<=`_2;
      4'b0011:d2<=`_3;
      4'b0100:d2<=`_4;
      4'b0101:d2<=`_5;
      4'b0110:d2<=`_6;
      4'b0111:d2<=`_7;
      4'b1000:d2<=`_8;
      4'b1001:d2<=`_9;
      4'b1010:d2<=`A;
      4'b1011:d2<=`B;
      4'b1100:d2<=`C;
      4'b1101:d2<=`D;
      4'b1110:d2<=`E;
      4'b1111:d2<=`F;
    endcase
  end
  
endmodule