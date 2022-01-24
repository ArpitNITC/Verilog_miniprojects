module universal_shift#(parameter N=4)(output reg[N-1:0] qb,input[1:0] choice,input[N-1:0] sin,input clk,rst);
always@(posedge clk)
begin
if(rst)
qb<=0;
else
begin
case(choice)
2'b00: qb<=qb;
2'b01: qb<={sin[0],qb[N-1:1]};
2'b10: qb<={qb[N-2:0],sin[N-1]};
2'b11: qb<=sin;
endcase
end
end
endmodule