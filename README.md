# StealthPent

**StealthPent** is a network penetration testing toolkit designed for both speed and stealth. It provides two operational modes:
- **Standard Mode**: Faster scans with less focus on evasion.
- **Paranoid Mode**: Slower, highly stealthy scans to evade detection.

## Features
- **Standard and Paranoid Modes**: Choose between faster scans or highly stealthy ones.
- **Comprehensive Workflow**: Includes port scanning, service enumeration, vulnerability scanning, network recon, and OSINT gathering.
- **Automation**: Use `workflow.sh` to automate the entire process.
- **Flexibility**: Customizable scans with options to target all ports or specific ports.

## Repository Structure

```plaintext
StealthPent/
│
├── config/
│   └── targets.txt            # List of IP:PORT targets for scanning
│
├── results/
│   └── scan_results/          # Directory where scan results will be saved
│
├── scripts/
│   ├── standard/              # Scripts for standard mode (faster, less stealthy)
│   │   ├── scan_ports.sh
│   │   ├── enumerate_services.sh
│   │   ├── vulnerability_scan.sh
│   │   ├── recon_network.sh
│   │   └── gather_osint.sh
│   │
│   └── paranoid/              # Scripts for paranoid mode (slower, more stealthy)
│       ├── scan_ports.sh
│       ├── enumerate_services.sh
│       ├── vulnerability_scan.sh
│       ├── recon_network.sh
│       └── gather_osint.sh
│
├── .gitignore                 # Specifies files and directories to ignore in version control
├── README.md                  # Documentation for the project
├── select_mode.sh             # Interactive script to choose mode and scan type
└── workflow.sh                # Automates the entire workflow of scanning, enumeration, and OSINT

```
## Setup Instructions

Clone the Repository:

     git clone https://github.com/yourusername/StealthPent.git
     cd StealthPent

Configure Targets:

     Edit config/targets.txt to list the IP addresses and ports you want to scan. Use the format IP:PORT (e.g.,        192.168.1.1:80).

## Usage

1. Using select_mode.sh
Run this script to interactively choose between standard and paranoid modes and to select the type of scan (all ports or custom ports).

Example Command:

      ./select_mode.sh

Follow the prompts to select your desired mode and scan type.

2. Using workflow.sh

   Automate the entire workflow for scanning, enumeration, and OSINT in one go.

Example Commands:

Standard mode with custom ports:

     ./workflow.sh standard custom
     
Paranoid mode with all ports:

     ./workflow.sh paranoid all


3. Running Individual Scripts

You can also run the individual scripts directly if you want more control.

Standard Mode:
                 
      ./scripts/standard/scan_ports.sh custom
      ./scripts/standard/enumerate_services.sh custom
      ./scripts/standard/vulnerability_scan.sh custom
      ./scripts/standard/recon_network.sh
      ./scripts/standard/gather_osint.sh


Paranoid Mode:

      ./scripts/paranoid/scan_ports.sh all
      ./scripts/paranoid/enumerate_services.sh all
      ./scripts/paranoid/vulnerability_scan.sh all
      ./scripts/paranoid/recon_network.sh
      ./scripts/paranoid/gather_osint.sh

Making the Scripts Executable
Before running any of these scripts, ensure they have executable permissions. You can make a script executable with the following command:
      
      chmod +x scriptname.sh

For example:
      
      chmod +x select_mode.sh
      chmod +x workflow.sh
      chmod +x scripts/standard/scan_ports.sh
      chmod +x scripts/paranoid/scan_ports.sh

## Dependencies 

      sudo apt-get install -y nmap netcat whois curl dnsutils openssl wget


## Contributing

Fork the repository, create a new branch, make your changes, and open a pull request.

## License

This project is licensed under the MIT License.
