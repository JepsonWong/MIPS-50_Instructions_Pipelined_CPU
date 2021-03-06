module mux(a,b,c,d,s0,s1,y);
  parameter size_data=5;
  input [size_data-1:0] a,b,c,d;
  input s0,s1;
  output [size_data-1:0] y;
  
  mux4 MUX4(a,b,c,d,s0,s1,y);
       defparam MUX4.size_data = size_data ;
  
  module mux2(a,b,s0,y);
  parameter size_data=5;
  input [size_data-1:0] a,b;
  input s0;
  output [size_data-1:0] y;
  
  reg [size_data-1:0] y1;
  assign y=y1;
  
  always @ (s0 or a or b)
  begin
    if(!s0)
      y1<=a;
    else
      y1<=b;
  end
endmodule

module mux4(a,b,c,d,s0,s1,y);
parameter size_data=5;
input [size_data-1:0] a,b,c,d;
input s0,s1;
output [size_data-1:0] y;

reg [size_data-1:0] y1;
assign y=y1;
  
always @ (s0 or s1 or a or b or c or d)
begin
  if(!s1)
    if(!s0)
      y1<=a;
    else
      y1<=b;
  else
    if(!s0)
      y1<=c;
    else
      y1<=d;
end
endmodule
  
endmodule

  