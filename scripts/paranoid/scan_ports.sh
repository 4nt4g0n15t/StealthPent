#!/bin/bash

scan_mode=$1

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    if [ "$scan_mode" == "all" ]; then
        nmap -p- $ip \
            -T1 \                       # Paranoid scan mode (very slow, stealthiest)
            --min-rate 50 \             # Further reduce rate of packets sent per second
            --max-retries 1 \           # Limit retries for unresponsive hosts
            --randomize-hosts \         # Randomize the order of scanned hosts
            --scan-delay 500ms \        # Add delay between sending packets
            --max-scan-delay 1s \       # Set maximum scan delay
            --data-length 16 \          # Send additional payload to blend with legitimate traffic
            --source-port 53 \          # Use a common source port (e.g., DNS) for scans
            --spoof-mac 00:11:22:33:44:55 \  # Use a randomized MAC address
            --badsum \                  # Use bad TCP/UDP checksums to evade simple firewalls
            --decoy 10.0.0.1,10.0.0.2 \ # Add decoys to hide the true source of the scan
            -oN results/scan_results/${ip}_all_ports_scan.txt
    else
        port=$(echo $target | cut -d':' -f2)
        nmap -p $port $ip \
            -T1 \
            --min-rate 50 \
            --max-retries 1 \
            --randomize-hosts \
            --scan-delay 500ms \
            --max-scan-delay 1s \
            --data-length 16 \
            --source-port 53 \
            --spoof-mac 00:11:22:33:44:55 \
            --badsum \
            --decoy 10.0.0.1,10.0.0.2 \
            -oN results/scan_results/${ip}_port_${port}.txt
    fi
    sleep $((RANDOM % 5 + 1))s         # Add a random sleep interval between 1-5 seconds
done < config/targets.txt
