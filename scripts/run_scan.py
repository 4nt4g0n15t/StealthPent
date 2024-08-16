from modules import network_scan, service_enum, vulnerability_scan, osint_gathering, recon

def run_custom_scan():
    print("Starting custom scan...")
    
    # Run network scan
    network_scan.scan_network()
    
    # Service enumeration
    service_enum.enumerate_services()
    
    # Vulnerability scanning
    vulnerability_scan.scan_vulnerabilities()
    
    # OSINT gathering
    osint_gathering.gather_osint()
    
    # Reconnaissance
    recon.perform_recon()
    
    print("Custom scan completed.")

if __name__ == "__main__":
    run_custom_scan()
