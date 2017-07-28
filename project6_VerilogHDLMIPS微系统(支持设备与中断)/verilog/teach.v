module test();
  reg clk;
  reg mips_rst,timer_rst,segment_rst;
  reg [31:0] DIn;
  wire [7:0] DOut;
  wire [7:0] segment;
  
  mini_machine MINI_MACHINE(clk,mips_rst,timer_rst,segment_rst,DIn,DOut,segment);
  
  initial begin
    clk=0;
    mips_rst=0;
    timer_rst=0;
    segment_rst=0;
    #10 mips_rst=1;#10 timer_rst=1;#10 segment_rst=1;
    #20 mips_rst=0;#20 timer_rst=0;#20 segment_rst=0;
    DIn=32'h00000001;
    
    #60000
    $stop;
  end
   
  always  
    #50 clk = ~clk;
  
  
endmodule

