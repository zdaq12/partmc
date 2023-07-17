#!/bin/sh

# exit on error
set -e
# turn on command echoing
set -v

mkdir -p out

../../build/partmc urban_plume_modal.spec

# Now run ./2_process_modal.sh to process the data
