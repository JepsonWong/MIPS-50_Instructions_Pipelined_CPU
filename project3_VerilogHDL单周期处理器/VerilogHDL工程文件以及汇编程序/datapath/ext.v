



module ext(Imm,Sign,Ext);
  input [15:0]Imm;
  input Sign;
  output [31:0]Ext;
  
  reg [31:0]ext;
  
  assign Ext=ext;
  
  always@ (Imm or Sign)
  begin
    if(Sign)
      ext<={ {16{Imm[15]}},Imm};
    else
      ext<={16'b0,Imm};
  end
endmodule