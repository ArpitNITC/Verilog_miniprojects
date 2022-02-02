module par2serial_tb;
reg[15:0] datain;
reg rst,clk;
wire[7:0] dataout;

par2serial DUT(dataout,datain,rst,clk);
initial begin
rst=1;
clk=0;
#45 rst=0;
end

initial begin
    datain=16'h3524;
#20 datain=16'h5e81;
#20 datain=16'hd609;
#20 datain=16'h5663;
#20 datain=16'h7b0d;
#20 datain=16'h998d;
end

initial begin
forever
#5 clk=~clk;
end

initial begin
$monitor($time," rst=%b,clk=%b,datain=%h,dataout=%h", rst,clk,datain,dataout);
$dumpfile("par2serial.vcd");
$dumpvars;
#120 $finish;
end
endmodule