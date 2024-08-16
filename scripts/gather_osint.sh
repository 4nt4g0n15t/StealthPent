#!/bin/bash

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    # OSINT Gathering with theHarvester
    theHarvester -d $ip -b all > results/scan_results/${ip}_osint.txt
done < config/targets.txt
