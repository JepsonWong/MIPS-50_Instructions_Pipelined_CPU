
module im_4k(addr,dout);
  input [11:2] addr;
  output [31:0] dout;
  
  reg [31:0] im [2047:0];
  
  initial
  begin
    $readmemh("D:\\srcc\\code.txt",im,32'b0);
    $readmemh("D:\\srcc\\ise.txt",im,32'b0001100000);
  end
  
  assign dout=im[addr];
  
endmodule
