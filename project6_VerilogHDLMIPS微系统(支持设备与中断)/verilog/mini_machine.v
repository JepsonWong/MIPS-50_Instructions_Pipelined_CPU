module mini_machine(clk,reset_mips,reset_timer,reset_segment,Din_external,Segment_O,segment_sel);
  input clk;
  input reset_mips,reset_timer,reset_segment;
  input [31:0] Din_external;
  output [7:0] Segment_O;
  output [7:0] segment_sel;
  
  wire [31:2] PrAddr;
  wire [3:0] BE;
  wire [31:0] PrDIn,PrDOut,time_DAT_I,time_DAT_O,sw_DAT_I,sw_DAT_O,segment_DAT_I,segment_DAT_O;
  wire Wen;
  wire [7:2] HWInt;
  wire IRQ;
  wire timer_we,sw_we,segment_we;
  wire [3:2] timer_ADD_I;
  wire sw_ADD_I,segment_ADD_I;
  //wire clk;
  
  //clk_wiz_v1_8 CLK(clk_in,clk);
  mips U_MIPS(clk,reset_mips,PrAddr,BE,PrDIn,PrDOut,Wen,HWInt);
  bridge U_BRIDGE(Wen,PrAddr,BE,PrDIn,PrDOut,HWInt,timer_ADD_I,timer_we,time_DAT_I,time_DAT_O,sw_ADD_I,sw_we,sw_DAT_I,sw_DAT_O,segment_ADD_I,segment_we,segment_DAT_I,segment_DAT_O,IRQ);
  timer U_TIMER(clk,reset_timer,timer_ADD_I,timer_we,time_DAT_I,time_DAT_O,IRQ);
  sw U_SW(sw_DAT_I,Din_external,sw_ADD_I,sw_we,sw_DAT_O);
  segment U_SGEMRNT(clk,reset_segment,segment_DAT_I,segment_ADD_I,segment_we,Segment_O,segment_DAT_O,segment_sel);
  
endmodule