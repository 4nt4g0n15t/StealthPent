#!/bin/bash

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    # Traceroute
    traceroute $ip > results/scan_results/${ip}_traceroute.txt
    
    # Whois Lookup
    whois $ip > results/scan_results/${ip}_whois.txt
    
    # DNS Recon
    dnsrecon -d $ip > results/scan_results/${ip}_dnsrecon.txt
done < config/targets.txt
