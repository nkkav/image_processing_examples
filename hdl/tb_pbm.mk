GHDL=ghdl
GHDLFLAGS=--ieee=standard -fexplicit --workdir=work
GHDLRUNFLAGS=--stop-time=2147483647ns

all : run

elab : force
	$(GHDL) -c $(GHDLFLAGS) -e tb_pbm

run : force
	$(GHDL) --elab-run $(GHDLFLAGS) tb_pbm $(GHDLRUNFLAGS)

init : force
	mkdir work
	$(GHDL) -a $(GHDLFLAGS) libv.vhd
	$(GHDL) -a $(GHDLFLAGS) pbm.vhd
	$(GHDL) -a $(GHDLFLAGS) tb_pbm.vhd

force : 

clean :
	rm -rf *.o work
