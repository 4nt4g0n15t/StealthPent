# StealthPent

**StealthPent** is an automated and stealthy penetration testing workflow designed to perform network reconnaissance and vulnerability assessment with minimal detection risk. Based on the Hactrics methodology, this tool focuses on stealth, efficiency, and effectiveness in gathering information and identifying potential vulnerabilities within a network.

## Features

- **Stealth Scanning**: Executes scans with low-speed settings to reduce the chances of detection by IDS/IPS systems.
- **Randomized Scanning**: Randomizes the order of IP addresses to prevent easy detection.
- **Service Enumeration**: Gathers information about services running on open ports using a low-intensity approach.
- **Vulnerability Scanning**: Identifies known vulnerabilities using stealthy techniques.
- **Additional Recon Tools**: Incorporates various network reconnaissance tools for comprehensive information gathering.
- **Flexible Scan Options**: Choose between scanning all ports or only custom-specified ports.
- **Paranoid Mode**: Enhanced stealth scanning with additional techniques to evade detection.

## Project Structure

StealthPent/
├── README.md
├── config/
│ └── targets.txt
├── scripts/
│ ├── standard/
│ │ ├── scan_ports.sh
│ │ ├── enumerate_services.sh
│ │ ├── vulnerability_scan.sh
│ │ ├── recon_network.sh
│ │ ├── gather_osint.sh
│ ├── paranoid/
│ │ ├── scan_ports.sh
│ │ ├── enumerate_services.sh
│ │ ├── vulnerability_scan.sh
│ │ ├── recon_network.sh
│ │ ├── gather_osint.sh
├── results/
│ └── scan_results/
├── workflow.sh
├── select_mode.sh
└── .gitignore


## Usage

### Selecting the Mode

You can choose between **Standard** and **Paranoid** modes depending on the level of stealth you require:

1. **Standard Mode**: Balanced between speed and stealth.
2. **Paranoid Mode**: Maximum stealth with the slowest and most cautious scanning.

### Running the Workflow

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/StealthPent.git
   cd StealthPent
2. **Configure Your Targets**

Add IP addresses and ports (for custom scans) to the config/targets.txt file in the format IP:Port.
3. **Select and Run the Workflow**

Choose your scan mode by running:
bash
Copy code
./select_mode.sh
Follow the prompts to select between Standard or Paranoid mode, and then the workflow will proceed with your chosen settings.
Review the Results

Results are saved in the results/scan_results/ directory for analysis.

