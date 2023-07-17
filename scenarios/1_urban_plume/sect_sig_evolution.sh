#!/bin/bash

set -e

base='sect_init_sig_'

for sig in $(seq 1.1 0.1 2.5);
do
    log_10_sig=$(echo "l($sig)/l(10)" | bc -l)

    sed -i "8s/.*/log10_geom_std_dev $log_10_sig/" aero_init_dist.dat

    sed -i "2s/.*/output_prefix out\/${base}${sig/./_}/" urban_plume_sect.spec
    sed -i "13s/.*/= \"out\/${base}${sig/./_}\"/" urban_plume_sect_process.F90

    cd ../../build
    make

    cd ../scenarios/1_urban_plume/

    sh ./1_run_sect.sh
    sh ./2_process_sect.sh
done