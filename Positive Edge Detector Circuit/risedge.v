module risedge(output out, input in,clk,rst);
reg s0=0,s1=1;
reg[1:0] pstate,nstate;
reg out;
always@(posedge clk)
begin
if(rst)
pstate<=s0;
else
pstate<=nstate;
end

always@(in,pstate)
begin
case(pstate)
s0:begin
nstate=in?s1:s0;
@(posedge clk)
out=in?1:0;
end
s1:begin
nstate=in?s1:s0;
@(posedge clk)
out=0;
end
default:begin
nstate=s0;
out=0;
end
endcase
end
endmodule