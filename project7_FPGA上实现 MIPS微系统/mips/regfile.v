module regfile(Clk,reset,RS1,RS2,RD,WData,RegWr,RD1,RD2);
  input Clk,RegWr,reset;
  input [4:0] RS1,RS2,RD;
  input [31:0] WData;
  output [31:0] RD1,RD2;
  
  reg [31:0] rf[31:0];
  integer i=0;

  always @(posedge Clk or posedge reset)
  begin
    if(reset)
      begin
    rf[5'd0]<=32'b0;rf[5'd1]<=32'b0;rf[5'd2]<=32'b0;rf[5'd3]<=32'b0;rf[5'd4]<=32'b0;
    rf[5'd5]<=32'b0;rf[5'd6]<=32'b0;rf[5'd7]<=32'b0;rf[5'd8]<=32'b0;rf[5'd9]<=32'b0;
    rf[5'd10]<=32'b0;rf[5'd11]<=32'b0;rf[5'd12]<=32'b0;rf[5'd13]<=32'b0;rf[5'd14]<=32'b0;
    rf[5'd15]<=32'b0;rf[5'd16]<=32'b0;rf[5'd17]<=32'b0;rf[5'd18]<=32'b0;rf[5'd19]<=32'b0;
    rf[5'd20]<=32'b0;rf[5'd21]<=32'b0;rf[5'd22]<=32'b0;rf[5'd23]<=32'b0;rf[5'd24]<=32'b0;
    rf[5'd25]<=32'b0;rf[5'd26]<=32'b0;rf[5'd27]<=32'b0;rf[5'd28]<=32'h00001800;rf[5'd29]<=32'h00002ffc;
    rf[5'd30]<=32'b0;rf[5'd31]<=32'b0;
    i=i+1;
  end
else
  if(RegWr&&(RD!=5'b0)) 
    begin
  rf[RD]<= WData;
    end
  end
  
  assign RD1=((RS1==RD)&(RegWr==1'b1)&(RegWr))? WData:rf[RS1];
  
  assign RD2=((RS2==RD)&(RegWr==1'b1)&(RegWr))? WData:rf[RS2];
  
endmodule