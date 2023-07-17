#!/bin/bash

set -e

sect='sect_dpg_'
modal='modal_dpg_'

for i in $(seq 100 500 10100)
do
    dpg=$(echo "$i/1000000000" | bc -l)

    sed -i "7s/.*/geom_mean_diam $dpg/" aero_init_dist.dat

    for sig in $(seq 1.1 0.1 2.5)
    do
        log_10_sig=$(echo "l($sig)/l(10)" | bc -l)
        echo "dpg = $dpg ; sig = $sig "

        sed -i "8s/.*/log10_geom_std_dev $log_10_sig/" aero_init_dist.dat

        sed -i "2s/.*/output_prefix out\/${sect}${dpg}_sig_${sig/./_}/" urban_plume_sect.spec
        sed -i "13s/.*/= \"out\/${sect}${dpg}_sig_${sig/./_}\"/" urban_plume_sect_process.F90

        sed -i "2s/.*/output_prefix out\/${modal}${dpg}_sig_${sig/./_}/" urban_plume_modal.spec
        sed -i "13s/.*/= \"out\/${modal}${dpg}_sig_${sig/./_}\"/" urban_plume_modal_process.F90

        cd ../../build
        make

        cd ../scenarios/1_urban_plume/

        sh ./1_run_sect.sh
        sh ./2_process_sect.sh

        sh ./1_run_modal.sh
        sh ./2_process_modal.sh
    done
done