
module data_ext(data,be,whb,ext);
  input [31:0] data;
  input [3:0] be;
  input [7:0] whb;
  output [31:0] ext;
  
  reg [31:0] e;
  wire sign;
  
  assign sign=((whb[5]==1)|(whb[7]==1)) ? 1:0;
  assign ext=e;
  
  always @  (data or be or sign)
  begin
    case(be)
      4'b0001:begin if(sign) e<={{24{data[7]}},data[7:0]};
                    else     e<={24'b0,data[7:0]};
      end
      4'b0010:begin if(sign) e<={{24{data[15]}},data[15:8]};
                   else         e<={24'b0,data[15:8]};
      end
      4'b0100:begin if(sign) e<={{24{data[23]}},data[23:16]};
                   else        e<={24'b0,data[23:16]};
      end
      4'b1000:begin if(sign) e<={{24{data[31]}},data[31:24]};
                  else         e<={24'b0,data[31:24]};
      end
      4'b0011:begin if(sign) e<={{16{data[15]}},data[15:0]};
                  else         e<={16'b0,data[15:0]};
      end
      4'b1100:begin if(sign) e<={{16{data[31]}},data[31:16]};
                 else          e<={16'b0,data[31:16]};
      end
      default:e<=data;
    endcase
  end
  
endmodule