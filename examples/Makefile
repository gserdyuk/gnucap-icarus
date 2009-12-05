
IVL_HOME=/usr/local/bin

all: links netlist-dkc.vvp bindsigs.vpi

links:
	ln -sf  ../icarus/verilog/vpi/bindsigs.cc bindsigs.cc 
	ln -sf  ../icarus/verilog/vpi/v2005_math.vpi v2005_math.vpi 
	ln -sf  ../icarus/verilog/vpi/va_math.vpi va_math.vpi 
	ln -sf  ../icarus/verilog/vpi/system.vpi system.vpi 
       
netlist-dkc.vvp: netlist-dkc.v
	$(IVL_HOME)/iverilog -I/usr/local/lib/ivl -o $@ $<

bindsigs.vpi: bindsigs.cc
	$(IVL_HOME)/iverilog-vpi -I../icarus/verilog/vvp $<

run:
	../src/gnucap -c verilog netlist-dkc.sp </dev/null

run1:
	../src/gnucap -a ../src/gnucap-icarus.so -c verilog netlist-dkc.sp </dev/null

run2:
	../../src/gnucap -a ../gnucap-icarus.so -c verilog netlist-dkc.sp </dev/null



clean:
	rm -f *.o
	rm -f bindsigs.cc
	rm -f *.vpi
	rm -f *.vvp
