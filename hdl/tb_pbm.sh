#!/bin/bash

# Run GHDL simulation.
make -f tb_pbm.mk clean
make -f tb_pbm.mk init
make -f tb_pbm.mk run

# Generate statistics.
if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running for $SECONDS $units."
exit 0
