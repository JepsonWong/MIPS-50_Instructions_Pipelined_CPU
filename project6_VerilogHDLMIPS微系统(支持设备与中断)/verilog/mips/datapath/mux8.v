module mux8(a,b,c,d,e,f,g,h,s,y);
parameter size_data=5;
input [size_data-1:0] a,b,c,d,e,f,g,h;
input [2:0] s;
output [size_data-1:0] y;

reg [size_data-1:0] y1;
assign y=y1;
  
always @ (s or a or b or c or d or e or f or g or h)
begin
  case(s)
    3'b000:y1<=a;
    3'b001:y1<=b;
    3'b010:y1<=c;
    3'b011:y1<=d;
    3'b100:y1<=e;
    3'b101:y1<=f;
    3'b110:y1<=g;
    3'b111:y1<=h;
  endcase
end

endmodule
