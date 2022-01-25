module taillamp1_tb;
reg TL,TR,E,clk,rst;
wire[0:2] LI,RI;

taillamp1 DUT(LI,RI,E,TL,TR,clk,rst);
initial begin
rst=0;
clk=0;
#4 rst=1;
#2 rst=0;
end

initial begin
#10 TL=0;TR=0;E=0;
#50 TL=1;TR=0;E=0;
#100 TL=0;TR=0;E=0;
#50 TL=0;TR=0;E=1;
#100 TL=0;TR=0;E=0;
#50 TL=0;TR=1;E=0;
#100 TL=0;TR=0;E=0;
#50 TL=1;TR=0;E=1;
#100 TL=0;TR=0;E=0;
end

initial begin
forever 
#5 clk=~clk;
end

initial begin
$monitor($time,"TL=%b; TR=%b; E=%b; LI=%b; RI=%b",TL,TR,E,LI,RI);
$dumpfile("taillamp1.vcd");
$dumpvars;
#800 $finish;
end
endmodule