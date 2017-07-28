



module mux(a,b,c,d,s0,s1,y);
  parameter size_data=5;
  input [size_data-1:0] a,b,c,d;
  input s0,s1;
  output [size_data-1:0] y;
  
  mux2 MUX2(a,b,s0,y);
       defparam MUX2.size_data = size_data ;
  
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
endmodule

  