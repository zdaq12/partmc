#!/bin/bash

# make sure that the current directory is the one where this script is
cd ${0%/*}

echo "../../partmc run_part.spec"
../../partmc run_part.spec

echo "../../extract_aero_species out/nucleate_part_0001_ out/aero_species.txt"
../../extract_aero_species out/nucleate_part_0001_ out/aero_species.txt

echo "../../test_nucleate_ode"
../../test_nucleate_ode

echo "../../numeric_diff out/aero_species.txt out/nucleate_ode_aero.txt 0 5e-2 0 0 2 0"
../../numeric_diff out/aero_species.txt out/nucleate_ode_aero.txt 0 5e-2 0 0 2 0
exit $?
