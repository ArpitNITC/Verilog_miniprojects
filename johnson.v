module johnson(output reg[3:0] Q,input clk,rst);
always@(posedge clk)
begin
if(rst)
Q<=4'b0000;
else
Q<={~Q[0],Q[3:1]};
end
endmodule

