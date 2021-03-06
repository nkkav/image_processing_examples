GHDL=ghdl
GHDLFLAGS=--ieee=standard -fexplicit --workdir=work
GHDLRUNFLAGS=--stop-time=2147483647ns

all : run

elab : force
	$(GHDL) -c $(GHDLFLAGS) -e tb_libv

run : force
	$(GHDL) --elab-run $(GHDLFLAGS) tb_libv $(GHDLRUNFLAGS)

init : force
	mkdir work
	$(GHDL) -a $(GHDLFLAGS) libv.vhd
	$(GHDL) -a $(GHDLFLAGS) tb_libv.vhd

force : 

clean :
	rm -rf *.o work
