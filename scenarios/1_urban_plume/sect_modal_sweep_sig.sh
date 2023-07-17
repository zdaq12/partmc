#!/bin/bash

set -e

sect='sect_sig_'
modal='modal_sig_'
base='_urban_plume'

for sig in $(seq 1.1 0.1 2.5);
do
    log_10_sig=$(echo "l($sig)/l(10)" | bc -l)
    echo "$sig --> $log_10_sig"

    sed -i "8s/.*/log10_geom_std_dev $log_10_sig/" aero_init_dist.dat

    sed -i "2s/.*/output_prefix out\/${sect}${sig/./_}${base}/" urban_plume_sect.spec
    sed -i "13s/.*/= \"out\/${sect}${sig/./_}${base}\"/" urban_plume_sect_process.F90

    sed -i "2s/.*/output_prefix out\/${modal}${sig/./_}${base}/" urban_plume_modal.spec
    sed -i "13s/.*/= \"out\/${modal}${sig/./_}${base}\"/" urban_plume_modal_process.F90

    cd ../../build
    make

    cd ../scenarios/1_urban_plume/

    sh ./1_run_sect.sh
    sh ./2_process_sect.sh

    sh ./1_run_modal.sh
    sh ./2_process_modal.sh
done
