module Mux_4x1(output o,input i3,i2,i1,i0,s1,s0);
wire o1,o2;
Mux_2x1 M1(o1,i3,i2,s0);
Mux_2x1 M2(o2,i1,i0,s0);
Mux_2x1 M3(o,o1,o2,s1);
endmodule

module Mux_2x1(output wire out,input a,b,sel);
assign out=sel?a:b;
endmodule