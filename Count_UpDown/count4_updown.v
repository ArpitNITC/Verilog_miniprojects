module count4_updown(output reg[3:0] count,input choice,clk,rst);
always@(posedge clk)
begin
if(rst)
count=0;
else
begin

if(choice)
count<=count+1;

else
count<=count-1;

end
end
endmodule