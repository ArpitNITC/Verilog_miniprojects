module Mux_4x1_tb;
reg i3,i2,i1,i0,s1,s0;
wire o;

Mux_4x1 DUT(o,i3,i2,i1,i0,s1,s0);
initial 
begin
    i3=0;i2=0;i1=0;i0=1;s1=0;s0=0;
#10 i3=0;i2=0;i1=1;i0=0;s1=0;s0=1;
#10 i3=0;i2=1;i1=0;i0=0;s1=1;s0=0;
#10 i3=1;i2=0;i1=0;i0=0;s1=1;s0=1;
end

initial begin
$monitor($time, "i3=%b;i2=%b;i1=%b;i0=%b,s1=%b;s0=%b;o=%b",i3,i2,i1,i0,s1,s0,o);
$dumpfile("Mux_4x1.vcd");
$dumpvars;
#50 $finish;
end
endmodule