from modules import network_scan, service_enum, vulnerability_scan, osint_gathering, recon

def run(ip_address):
    print(f"Running in Paranoid Mode on {ip_address}...")
    network_scan.scan_network(ip_address, stealth=True)
    service_enum.enumerate_services(ip_address, stealth=True)
    vulnerability_scan.scan_vulnerabilities(ip_address, stealth=True)
    osint_gathering.gather_osint(ip_address, stealth=True)
    recon.perform_recon(ip_address, stealth=True)
