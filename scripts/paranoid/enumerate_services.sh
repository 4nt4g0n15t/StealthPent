#!/bin/bash

scan_mode=$1

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    if [ "$scan_mode" == "all" ]; then
        nmap -sV -p- $ip \
            -T1 --version-intensity 5 \
            --max-retries 1 \
            --scan-delay 500ms \
            --max-scan-delay 1s \
            --data-length 16 \
            --source-port 53 \
            --spoof-mac 00:11:22:33:44:55 \
            --badsum \
            --decoy 10.0.0.1,10.0.0.2 \
            -oN results/scan_results/${ip}_service_enumeration_all_ports.txt
    else
        port=$(echo $target | cut -d':' -f2)
        nmap -sV -p $port $ip \
            -T1 --version-intensity 5 \
            --max-retries 1 \
            --scan-delay 500ms \
            --max-scan-delay 1s \
            --data-length 16 \
            --source-port 53 \
            --spoof-mac 00:11:22:33:44:55 \
            --badsum \
            --decoy 10.0.0.1,10.0.0.2 \
            -oN results/scan_results/${ip}_service_enumeration.txt
    fi
done < config/targets.txt
