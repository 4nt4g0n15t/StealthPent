
```bash
#!/bin/bash

scan_mode=$1

while IFS= read -r target
do
    ip=$(echo $target | cut -d':' -f1)
    
    if [ "$scan_mode" == "all" ]; then
        nmap -p- $ip -T2 --min-rate 100 --max-retries 3 --randomize-hosts --scan-delay 100ms --max-scan-delay 500ms -oN results/scan_results/${ip}_all_ports_scan.txt
    else
        port=$(echo $target | cut -d':' -f2)
        nmap -p $port $ip -T2 --min-rate 100 --max-retries 3 --randomize-hosts --scan-delay 100ms --max-scan-delay 500ms -oN results/scan_results/${ip}_port_${port}.txt
    fi
done < config/targets.txt
