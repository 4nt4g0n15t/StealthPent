# Comprehensive Stealth Port Scanner with OS Fingerprinting and WHOIS Data Retrieval

## Overview

This tool performs stealthy port scanning, OS fingerprinting, and WHOIS data retrieval, providing comprehensive network insights. It can handle single or multiple IPs, scan custom or common ports, and save detailed reports.

## Features

- **Stealth Scanning**: Minimize detection risk using fragmented packets, random delays, and IP spoofing.
- **Service Enumeration**: Identify running services on open ports.
- **OS Fingerprinting**: Analyze TCP/IP stack responses to deduce the target's operating system.
- **WHOIS Data Retrieval**: Gather WHOIS information for each target IP.
- **Detailed Reports**: Save results in well-structured reports with information on open ports, services, OS fingerprinting, and WHOIS data.

## Usage

### Direct IP Input

```bash
python3 main.py -i 192.168.1.1 -p common -v

File Input (Multiple IPs)

bash

python3 main.py -f targets.txt -p all -v

Options

    -i: Specify the target IP address.
    -f: Specify the targets.txt file containing a list of IP addresses.
    -p: Choose ports to scan: custom (user-defined), common, or all.
    -v: Enable verbose mode for real-time updates.

Installation

bash

pip install scapy python-whois asyncio

Future Enhancements

    Vulnerability Scanning: Integrate vulnerability databases to identify potential security risks.

License

This project is licensed under the MIT License.

vbnet


### Step 4: Finalizing the Project

1. **Ensure the `reports/` directory exists** before running the tool, as it’s where the reports will be saved.
2. **Test the project** thoroughly to catch any potential issues before deployment.

This setup provides a complete, functional, and efficient port scanning tool with service enumeration, detailed reporting, and robust error handling.

