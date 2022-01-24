module universal_shift_tb;
wire[3:0] qb;
reg[1:0] choice;
reg clk,rst;
reg[3:0] sin;
universal_shift#4 DUT(qb,choice,sin,clk,rst);
initial begin
rst=0;
clk=0;
#4 rst=1;
#2 rst=0;
end
initial begin
#14 sin=4'b1001;choice=2'b00;
#10 sin=4'b1001;choice=2'b10;
#10 sin=4'b0001;choice=2'b10;
#10 sin=4'b0011;choice=2'b10;
#10 sin=4'b0111;choice=2'b10;
#10 sin=4'b1001;choice=2'b10;
#10 sin=4'b1111;choice=2'b11;
#10 sin=4'b1001;choice=2'b01;
#10 sin=4'b0000;choice=2'b01;
#10 sin=4'b0000;choice=2'b01;
#10 sin=4'b1001;choice=2'b01;
end
initial begin
forever
#5 clk=~clk;
end

initial begin
$monitor($time, "choice=%b; sin=%b; qb=%b", choice,sin,qb);
$dumpfile("universal_shift.vcd");
$dumpvars;
#150 $finish;
end
endmodule