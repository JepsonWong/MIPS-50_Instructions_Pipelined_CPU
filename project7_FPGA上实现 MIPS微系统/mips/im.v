
module im_4k(addrr,dout);
  input [31:2] addrr;
  output [31:0] dout;
  
  wire [11:2] addr,add;
  wire [31:2] addr_isel;
  wire [31:0] dout1,dout2;
  
  reg [31:0] im [2047:0];
  reg [31:0] ise [2047:0];
  
  assign addr_isel=addrr-30'b000000000000000001000001100000;
  assign addr=addrr[11:2];
  assign add=addr_isel[11:2];
  
  initial
  begin
    $readmemh("D:\\srcc\\code.txt",im,32'b0);
   $readmemh("D:\\srcc\\ise.txt",ise,32'b0);
  end
  //code CODE(clk,addr,dout1);
  //ise  ISE(clk,add,dout2);
  
  assign dout1=im[addr];
  assign dout2=ise[add];
  assign dout=(addrr>=30'b000000000000000001000001100000) ? dout2:dout1;
  
endmodule