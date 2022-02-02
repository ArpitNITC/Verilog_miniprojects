module par2serial(output reg[7:0] dataout, input[15:0] datain, input rst,clk);
reg[7:0] datainlsb;
reg[7:0] datainmsb;
always@(datain)
begin
datainmsb=datain[15:8];
datainlsb=datain[7:0];
end
always@(posedge clk)
begin
if(rst)
dataout=0;
else
begin
dataout=datainmsb;
datainmsb=datainlsb;
end
end
endmodule


