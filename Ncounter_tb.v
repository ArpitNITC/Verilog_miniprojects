module Ncounter_tb;
wire[3:0] tq;
reg tclk,trst;
Ncounter#(4) DUT(tq,tclk,trst);
initial begin
tclk=0;
trst=0;
#10 trst=1;
#10 trst=0;
end
initial begin
forever
#10 tclk=~tclk;
end
initial begin
$monitor($time," tq=%b",tq);
$dumpfile("Ncounter.vcd");
$dumpvars;
#200 $finish;
end
endmodule