#!/bin/bash

# Choose mode: standard or paranoid
mode=$1

# Choose scan type: all or custom ports
scan_type=$2

if [ "$mode" == "standard" ]; then
    bash scripts/standard/scan_ports.sh $scan_type
    bash scripts/standard/enumerate_services.sh $scan_type
    bash scripts/standard/vulnerability_scan.sh $scan_type
    bash scripts/standard/recon_network.sh
    bash scripts/standard/gather_osint.sh
elif [ "$mode" == "paranoid" ]; then
    bash scripts/paranoid/scan_ports.sh $scan_type
    bash scripts/paranoid/enumerate_services.sh $scan_type
    bash scripts/paranoid/vulnerability_scan.sh $scan_type
    bash scripts/paranoid/recon_network.sh
    bash scripts/paranoid/gather_osint.sh
else
    echo "Invalid mode. Please choose 'standard' or 'paranoid'."
fi
