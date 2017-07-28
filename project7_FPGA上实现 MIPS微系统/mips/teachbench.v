module test();
  reg clk;
  reg mips_rst;
  
  datapath DATAPATH(clk,mips_rst);
  
  initial begin
    clk=0;
    mips_rst=0;
    #10 mips_rst=1;
    #20 mips_rst=0;
    
    //#60000
    //$stop;
  end
   
  always  
    #50 clk = ~clk;
  
  
endmodule