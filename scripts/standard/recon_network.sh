#!/bin/bash

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    # Example recon tools
    whois $ip > results/scan_results/${ip}_whois.txt
    dig -x $ip > results/scan_results/${ip}_reverse_dns.txt
    traceroute $ip > results/scan_results/${ip}_traceroute.txt
done < config/targets.txt
