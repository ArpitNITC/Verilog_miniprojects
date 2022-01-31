module clock3_tb;
wire clk3;
reg clk,reset;

clock3 DUT(clk3,clk,reset);
initial begin
clk=0;
forever
#5 clk=~clk;
end

initial begin
#5 reset=1;
#10 reset=0;
end

initial begin
$monitor($time, "clk=%b,clk3=%b",clk,clk3);
$dumpfile("clock3.vcd");
$dumpvars;
#400 $finish;
end

endmodule