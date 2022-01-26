module seq_1100_tb;
reg in,clk,rst;
wire y;
seq_1100 DUT(y,in,clk,rst);
initial begin
rst=0;
clk=0;
#4 rst=1;
#2 rst=0;
end

initial begin
@(posedge clk) in=0;
@(posedge clk) in=0;
@(posedge clk) in=1;
@(posedge clk) in=1;
@(posedge clk) in=0;
@(posedge clk) in=0;
@(posedge clk) in=0;
@(posedge clk) in=1;
@(posedge clk) in=1;
@(posedge clk) in=1;
@(posedge clk) in=1;
@(posedge clk) in=0;
@(posedge clk) in=0;
@(posedge clk) in=1;
@(posedge clk) in=1;
@(posedge clk) in=0;
@(posedge clk) in=1;
@(posedge clk) in=1;
@(posedge clk) in=0;
@(posedge clk) in=0;
@(posedge clk) in=0;
end

initial begin
forever 
#5 clk=~clk;
end

initial begin
$monitor($time,"in=%b; y=%b", in,y);
$dumpfile("seq_1100.vcd");
$dumpvars;
#300 $finish;
end
endmodule




