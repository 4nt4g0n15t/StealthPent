import argparse
import sys
from modules.network_scan import NetworkScanner

def main():
    parser = argparse.ArgumentParser(description="Comprehensive Stealth Port Scanner")
    parser.add_argument('-i', '--ip', type=str, help='Target IP address')
    parser.add_argument('-f', '--file', type=str, help='File containing list of IP addresses')
    parser.add_argument('-p', '--ports', type=str, default='common', help='Ports to scan: custom (user-defined), common, or all')
    parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose mode for real-time updates')
    
    args = parser.parse_args()
    
    if not args.ip and not args.file:
        print("Error: Either --ip or --file must be provided.")
        sys.exit(1)
    
    scanner = NetworkScanner(verbose=args.verbose)
    
    if args.ip:
        scanner.scan_ip(args.ip, args.ports)
    elif args.file:
        with open(args.file, 'r') as file:
            ips = file.readlines()
            for ip in ips:
                scanner.scan_ip(ip.strip(), args.ports)

if __name__ == "__main__":
    main()
