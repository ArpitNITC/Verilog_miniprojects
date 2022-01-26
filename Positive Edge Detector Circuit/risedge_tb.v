module risedge_tb;
reg in,clk,rst;
wire out;
risedge DUT(out,in,clk,rst);
initial begin
rst=0;
clk=0;
#4 rst=1;
#2 rst=0;
end

initial begin
#5 in=0;
#5 in=0;
#5 in=0;
#5 in=0;
#2 in=1;
#40 in=0;
#5 in=0;
#5 in=0;
#5 in=1;
#20 in=0;
#5 in=1;
#1 in=0;
end

initial begin
forever 
#5 clk=~clk;
end

initial begin
$monitor($time,"in=%b; out=%b", in,out);
$dumpfile("risedge.vcd");
$dumpvars;
#200 $finish;
end
endmodule




