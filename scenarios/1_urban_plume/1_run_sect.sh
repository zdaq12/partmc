#!/bin/sh

# exit on error
set -e
# turn on command echoing
set -v

mkdir -p out

../../build/partmc urban_plume_sect.spec

# Now run ./2_process_sect.sh to process the data
