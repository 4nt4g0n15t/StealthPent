#!/bin/bash

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    # Example OSINT tools
    theharvester -d $ip -b google -l 100 -f results/scan_results/${ip}_theharvester.xml
    shodan search $ip > results/scan_results/${ip}_shodan.txt
done < config/targets.txt
