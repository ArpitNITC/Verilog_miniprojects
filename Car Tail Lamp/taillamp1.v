module taillamp1(output reg[0:2] LEFT_INDICATOR_LAMP,RIGHT_INDICATOR_LAMP,input EMERGENCY,TURN_LEFT,TURN_RIGHT,CLOCK,RESET);
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5;
reg[2:0] pstate,nstate;

always@(CLOCK)
begin
if(RESET)
pstate<=s0;
else
pstate<=nstate;
end

always@(TURN_LEFT or TURN_RIGHT or EMERGENCY or pstate)
begin
case(pstate)
s0:begin
if(EMERGENCY)
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
nstate=s1;
end
else if(TURN_LEFT)
begin
@(posedge CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
nstate=s1;
end
else if(TURN_RIGHT)
begin
@(posedge CLOCK)
RIGHT_INDICATOR_LAMP=3'b000;
nstate=s1;
end
else
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
nstate=s0;
end
end

s1:begin
if(EMERGENCY)
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b100;
RIGHT_INDICATOR_LAMP=3'b001;
nstate=s2;
end
else if(TURN_LEFT)
begin
@(posedge CLOCK)
LEFT_INDICATOR_LAMP=3'b100;
nstate=s2;
end
else if(TURN_RIGHT)
begin
@(posedge CLOCK)
RIGHT_INDICATOR_LAMP=3'b001;
nstate=s2;
end
else
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
nstate=s0;
end
end

s2:begin
if(EMERGENCY)
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b110;
RIGHT_INDICATOR_LAMP=3'b011;
nstate=s3;
end
else if(TURN_LEFT)
begin
@(posedge CLOCK)
LEFT_INDICATOR_LAMP=3'b110;
nstate=s3;
end
else if(TURN_RIGHT)
begin
@(posedge CLOCK)
RIGHT_INDICATOR_LAMP=3'b011;
nstate=s3;
end
else
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
nstate=s0;
end
end

s3:begin
if(EMERGENCY)
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b111;
RIGHT_INDICATOR_LAMP=3'b111;
nstate=s4;
end
else if(TURN_LEFT)
begin
@(posedge CLOCK)
LEFT_INDICATOR_LAMP=3'b111;
nstate=s0;
end
else if(TURN_RIGHT)
begin
@(posedge CLOCK)
RIGHT_INDICATOR_LAMP=3'b111;
nstate=s0;
end
else
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
nstate=s0;
end
end

s4:begin
if(EMERGENCY)
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b110;
RIGHT_INDICATOR_LAMP=3'b011;
nstate=s5;
end
else
begin
nstate=s0;
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
end
end

s5:begin
if(EMERGENCY)
begin
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b100;
RIGHT_INDICATOR_LAMP=3'b001;
nstate=s0;
end
else
begin
nstate=s0;
@(CLOCK)
LEFT_INDICATOR_LAMP=3'b000;
RIGHT_INDICATOR_LAMP=3'b000;
end
end

default:begin
nstate=s0;
end
endcase
end
endmodule

