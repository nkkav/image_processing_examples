GHDL=ghdl
GHDLFLAGS=--ieee=standard -fexplicit --workdir=work
GHDLRUNFLAGS=--stop-time=2147483647ns

all : run

elab : force
	$(GHDL) -c $(GHDLFLAGS) -e tb_pgm

run : force
	$(GHDL) --elab-run $(GHDLFLAGS) tb_pgm $(GHDLRUNFLAGS)

init : force
	mkdir work
	$(GHDL) -a $(GHDLFLAGS) libv.vhd
	$(GHDL) -a $(GHDLFLAGS) pgm.vhd
	$(GHDL) -a $(GHDLFLAGS) tb_pgm.vhd

force : 

clean :
	rm -rf *.o work
