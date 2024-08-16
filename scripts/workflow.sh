#!/bin/bash

echo "Select Scan Mode:"
echo "1. Scan All Ports"
echo "2. Scan Custom Ports"

read -p "Enter your choice (1 or 2): " choice

if [ "$choice" == "1" ]; then
    scan_mode="all"
elif [ "$choice" == "2" ]; then
    scan_mode="custom"
else
    echo "Invalid choice. Exiting."
    exit 1
fi

# Execute each phase of the workflow
bash scripts/scan_ports.sh $scan_mode
bash scripts/enumerate_services.sh $scan_mode
bash scripts/vulnerability_scan.sh $scan_mode
bash scripts/recon_network.sh
bash scripts/gather_osint.sh

echo "Workflow completed. Check the results in the results/scan_results/ directory."
