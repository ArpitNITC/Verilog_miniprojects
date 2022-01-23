module Ncounter#(parameter N=4)(output reg[N-1:0] Q,input clk,rst);
always@(posedge clk)
begin
if(rst)
Q<=0;
else
Q<=Q+1;
end
endmodule

