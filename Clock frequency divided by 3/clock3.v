module clock3(output wire clk3,input clk,reset);
reg[1:0] p;
reg[1:0] n;
always@(posedge clk)
begin
if(reset)
p<=0;
else if(p==2)
p<=0;
else
p<=p+1;
end

always@(negedge clk)
begin
if(reset)
n<=0;
else if(n==2)
n<=0;
else
n<=n+1;
end
assign clk3=((p==2)|(n==2));

endmodule