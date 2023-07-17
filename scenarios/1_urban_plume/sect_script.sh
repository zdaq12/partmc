#!/bin/bash

set -e

i=10
base='_sections_urban_plume'

until [ $i -gt 100 ]
do
    sed -i "2s/.*/output_prefix out\/${i}${base}/" urban_plume_sect.spec
    sed -i "9s/.*/n_bin ${i}/" urban_plume_sect.spec
    sed -i "13s/.*/= \"out\/${i}${base}\"/" urban_plume_sect_process.F90

    cd ../../build/
    make

    cd ../scenarios/1_urban_plume/

    sh ./1_run_sect.sh
    sh ./2_process_sect.sh
    ((i=i+10))
done

i=200

until [ $i -gt 1000 ]
do
    sed -i "2s/.*/output_prefix out\/${i}${base}/" urban_plume_sect.spec
    sed -i "9s/.*/n_bin ${i}/" urban_plume_sect.spec
    sed -i "13s/.*/= \"out\/${i}${base}\"/" urban_plume_sect_process.F90

    cd ../../build/
    make

    cd ../scenarios/1_urban_plume/

    sh ./1_run_sect.sh
    sh ./2_process_sect.sh
    ((i=i+100))
done

i=1500

until [ $i -gt 5000 ]
do
    sed -i "2s/.*/output_prefix out\/${i}${base}/" urban_plume_sect.spec
    sed -i "9s/.*/n_bin ${i}/" urban_plume_sect.spec
    sed -i "13s/.*/= \"out\/${i}${base}\"/" urban_plume_sect_process.F90

    cd ../../build/
    make

    cd ../scenarios/1_urban_plume/

    sh ./1_run_sect.sh
    sh ./2_process_sect.sh
    ((i=i+500))
done

i=10000

sed -i "2s/.*/output_prefix out\/${i}${base}/" urban_plume_sect.spec
sed -i "9s/.*/n_bin ${i}/" urban_plume_sect.spec
sed -i "13s/.*/= \"out\/${i}${base}\"/" urban_plume_sect_process.F90

cd ../../build/
make

cd ../scenarios/1_urban_plume/

sh ./1_run_sect.sh
sh ./2_process_sect.sh