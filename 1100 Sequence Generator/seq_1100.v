module seq_1100(output y,input in,clk,rst);
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg[1:0] pstate,nstate;
reg y;
always@(posedge clk)
begin
if(rst)
pstate<=s0;
else
pstate<=nstate;
end

always@(in or pstate)
begin
case(pstate)
s0:begin
nstate=in?s1:s0;
y=0;
end
s1:begin
nstate=in?s2:s0;
y=0;
end
s2:begin
nstate=in?s2:s3;
y=0;
end
s3:begin
nstate=in?s1:s0;
y=in?0:1;
end
default:begin
nstate=s0;
y=0;
end
endcase
end
endmodule






