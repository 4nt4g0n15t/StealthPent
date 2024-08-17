# StealthPent

**StealthPent** is a stealth port scanning tool designed for comprehensive network analysis. It performs port scanning, OS fingerprinting, and WHOIS data retrieval, generating detailed reports.

## Features

- **Stealth Scanning**: Uses fragmented packets, randomized delays, and spoofed source IPs.
- **Port Scanning**:
  - Custom Ports: Specify a list of ports.
  - Common Ports: Scan predefined commonly used ports.
  - All Ports: Scan all possible ports (1-65535).
- **OS Fingerprinting**: Identifies the likely operating system based on TCP/IP stack responses.
- **WHOIS Data Retrieval**: Fetches WHOIS information for the target IP.
- **Verbose Mode**: Provides real-time progress updates.

## Installation

Install the required dependencies with:

```bash
pip install scapy whois
```
## Usage

Scan a Single IP

    python3 main.py -i <IP_ADDRESS> -p <PORTS> -v

Scan Multiple IPs from a File

    python3 main.py -f <TARGETS_FILE> -p <PORTS> -v

## Options

    -i: Target IP address.
    -f: File containing a list of IP addresses (one per line).
    -p: Ports to scan:
        custom: Comma-separated list of ports (e.g., 22,80).
        common: Predefined commonly used ports.
        all: All ports (1-65535).
    -v: Enable verbose mode for real-time updates.


## Report

Reports are saved in the reports/ directory with the format ip_timestamp.txt. Each report includes:

-Open ports and their services.
-OS fingerprinting results.
-WHOIS data for the target IP.

#### Notes

    L3 Types Warning: Warnings about incompatible L3 types may appear. These can be safely ignored if they do not affect functionality.

### Future Enhancements

-Service Enumeration: Identify services running on open ports.
-Vulnerability Scanning: Integrate vulnerability databases to detect potential security issues.


This `README.md` provides a straightforward overview of the project, including installation, usage, and report details, all in a clean and concise format.
