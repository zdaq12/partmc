#!/bin/bash

# exit on error
set -e
# turn on command echoing
set -v
# make sure that the current directory is the one where this script is
cd ${0%/*}

../../numeric_diff out/emission_part_0001_aero_time.txt out/emission_exact_aero_time.txt 0 5e-2 0 0 2 2
