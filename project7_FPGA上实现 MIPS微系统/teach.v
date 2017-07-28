module test();
  reg clk;
  reg rst;
  reg [31:0] din;
  wire [7:0]dou,d;
  
  
  MINU MINI_MACHINE(din,clk,rst,dou,d);
  
  initial begin
    clk=0;
    rst=0;
    din=32'h12345678;
    #10 rst=1;#10 rst=1;
    #20000
    $stop;
  end
   
  always  
    #50 clk = ~clk ;
  
  
endmodule

