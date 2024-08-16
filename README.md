# StealthPent

## Overview

StealthPent is a network penetration testing toolkit designed for stealthy and efficient network testing. It provides two modes of operation: Standard Mode and Paranoid Mode, each offering different levels of stealth and thoroughness.

## Features

- **Mode Selection**: Choose between Standard Mode and Paranoid Mode.
- **Network Scanning**: Scan specific or all ports with stealth techniques.
- **Service Enumeration**: Identify services running on open ports.
- **Vulnerability Scanning**: Detect common vulnerabilities using available CVE data.
- **OSINT Gathering**: Gather public information such as WHOIS data and DNS records.
- **Reconnaissance**: Perform subdomain enumeration, DNS, and SSL certificate analysis.
- **Reporting**: Generate detailed reports in text or JSON format.

## Installation

To install the required dependencies, run:

```bash
pip install -r requirements.txt
```

## Usage
Run the main script and select the desired mode:
        
    python3 main.py

To run a custom scan:

    python3 scripts/run_scan.py

Generate a report:

    python3 scripts/generate_report.py

## Report
The generated report will be stored in the reports/ directory. It will include:

-Open ports and services.
-Detected vulnerabilities.
-OSINT findings (e.g., WHOIS, DNS information).

## Requirements

    pip install -r requirements.txt



 
