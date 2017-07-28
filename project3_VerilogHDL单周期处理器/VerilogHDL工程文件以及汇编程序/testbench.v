


`include    "D:\\srcc\\head.v"


`include    "D:\\srcc\\mips.v" 


`include    "D:\\srcc\\regfile.v" 
 

module testbench();
  reg clk,reset;
  
  mips MIPS(clk,reset);
  
  initial begin
    clk=0;
    reset=0;
    #100 reset = 1 ;
    #200 reset = 0 ;
  end
  always  
     #5000 clk = ~clk ;
  always @ (posedge clk)
  begin
    W();
    W();
    W();
    W();
    W();
    W();
    $stop;
  end
  task W;
    begin
     @ (posedge clk);
     @ (posedge clk);
     @ (posedge clk);
     @ (posedge clk);
     @ (posedge clk);
     @ (posedge clk);
     @ (posedge clk);
     @ (posedge clk);
   end
     endtask
endmodule


