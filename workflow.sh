#!/bin/bash

echo "Running StealthPent Workflow..."

bash scripts/selected/scan_ports.sh
bash scripts/selected/enumerate_services.sh
bash scripts/selected/vulnerability_scan.sh
bash scripts/selected/recon_network.sh
bash scripts/selected/gather_osint.sh

echo "Workflow completed. Check the results in the results/scan_results/ directory."
