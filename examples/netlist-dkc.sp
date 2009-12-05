
//* /home/jp/arails/arails0809/demo/g65/simulation/testLib/ringosc/20090526122839/hspice/netlist.sp
spice
.include ./mos.gc
vgnd gnd! 0 dc=0

.subckt inv__d (gnd vdd out in)
iin  in  gnd extpwl
+external="/usr/local/lib/libvvp.so:-M. -mbindsigs netlist-dkc.vvp:%m.in"
vout out gnd extpwl
+external="/usr/local/lib/libvvp.so:-M. -mbindsigs netlist-dkc.vvp:%m.out"
.ends

.verilog

module inv__a (gnd vdd out in);
pmos4  #(.w(1u),.l(240n),.m(1),.ad(2.05e-13),.as(2.05e-13),.pd(1.41e-06),.ps(1.41e-06)) Mmp1(out,in,vdd,vdd);
nmos4 #(.w(750n),.l(240n),.m(1),.ad(2.05e-13),.as(2.05e-13),.pd(1.41e-06),.ps(1.41e-06)) Mmn1(out,in,gnd,gnd);
endmodule

inv__a x1 (gnd!,vdd!,n2,n1);
inv__a x2 (gnd!,vdd!,n3,n2);
inv__a x3 (gnd!,vdd!,n4,n3);
inv__a x4 (gnd!,vdd!,n5,n4);
inv__d x5 (gnd!,vdd!,n1,n5);

vsource #(.dc(3)) Vv1 (.p(vdd!), .n(gnd!))
spice
.print tran v(nodes)
.tran 0.0 10n 10p
