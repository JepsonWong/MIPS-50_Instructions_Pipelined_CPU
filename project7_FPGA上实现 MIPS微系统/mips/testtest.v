module testtest();
  reg clk;
  reg rst;
  reg [31:0] DIn;
  wire [7:0] Segment1,Segment2;
  wire [7:0] D;
  
  mini_machine MINI_MACHINE(clk,rst,DIn,Segment1,Segment2,D);
  
  initial begin
    clk=0;
    rst=0;
    #10 rst=1;
    #20 rst=0;
    DIn=32'h00000001;
    
  end
   
  always  
    #50 clk = ~clk;
  
  
endmodule

