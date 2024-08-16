#!/bin/bash

scan_mode=$1

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    if [ "$scan_mode" == "all" ]; then
        nmap -sV -p- $ip -T2 --version-intensity 2 --max-retries 2 --scan-delay 100ms --max-scan-delay 500ms -oN results/scan_results/${ip}_service_enumeration_all_ports.txt
    else
        port=$(echo $target | cut -d':' -f2)
        nmap -sV -p $port $ip -T2 --version-intensity 2 --max-retries 2 --scan-delay 100ms --max-scan-delay 500ms -oN results/scan_results/${ip}_service_enumeration.txt
    fi
done < config/targets.txt
