module johnson_tb;
reg tclk,trst;
wire[3:0] tQ;
johnson DUT(tQ,tclk,trst);
initial begin
tclk=0;
trst=0;
#20 trst=1;
#25 trst=0;
end
initial begin
forever
#5 tclk=~tclk;
end
initial begin
$monitor($time," tQ=%b",tQ);
$dumpfile("johnson.vcd");
$dumpvars;
#150 $finish;
end
endmodule

