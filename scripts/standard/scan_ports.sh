#!/bin/bash

scan_mode=$1

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    if [ "$scan_mode" == "all" ]; then
        nmap -p- $ip \
            -T3 \                       # Normal scan mode (balanced between speed and stealth)
            --min-rate 100 \            # Adjust packet rate to balance stealth and speed
            --max-retries 3 \           # Moderate retries for unresponsive hosts
            --randomize-hosts \         # Randomize the order of scanned hosts
            --scan-delay 100ms \        # Add delay between sending packets
            --max-scan-delay 500ms \    # Set maximum scan delay
            -oN results/scan_results/${ip}_all_ports_scan.txt
    else
        port=$(echo $target | cut -d':' -f2)
        nmap -p $port $ip \
            -T3 \
            --min-rate 100 \
            --max-retries 3 \
            --randomize-hosts \
            --scan-delay 100ms \
            --max-scan-delay 500ms \
            -oN results/scan_results/${ip}_port_${port}.txt
    fi
    sleep $((RANDOM % 5 + 1))s         # Add a random sleep interval between 1-5 seconds
done < config/targets.txt
