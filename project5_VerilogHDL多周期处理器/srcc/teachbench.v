`include    "D:\\srcc\\mips.v" 

module testbench();
  reg clk,reset;
  
  mips MIPS(clk,reset);
  
  initial begin
    clk=0;
    reset=0;
    #10 reset = 1 ;
    #20 reset = 0 ;
    #20000
    $stop;
  end
  always  
     #50 clk = ~clk ;
 /*always @ (posedge clk)
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
     endtask*/
endmodule
