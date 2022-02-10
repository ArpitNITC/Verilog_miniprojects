module count4_updown_tb;
wire[3:0] count;
reg choice,clk,rst;
count4_updown DUT(count,choice,clk,rst);
initial begin
rst=0;
clk=0;
#4 rst=1;
#2 rst=0;
end
initial begin
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=0;
#10 choice=0;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=1;
#10 choice=0;
#10 choice=0;
#10 choice=0;
#10 choice=0;
#10 choice=0;
#10 choice=0;
end
initial begin
forever 
#5 clk=~clk;
end
initial begin
$monitor($time," choice=%b; count=%d", choice,count);
$dumpfile("count4_updown.vcd");
$dumpvars;
#300 $finish;
end
endmodule
