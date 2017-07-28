`include    "D:\\srcc\\head.v"  

module ID_CTRL(rst,npcop_in,npcop_out);
  
  input [2:0] npcop_in;
  input rst;
  output npcop_out;
  //output pcwr;
  
  assign npcop_out=(rst)?0:((npcop_in==3'b000)?0:1);
  //assign pcwr=1;///////////////////
  
endmodule