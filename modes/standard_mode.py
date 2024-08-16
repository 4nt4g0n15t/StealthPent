from modules import network_scan, service_enum, vulnerability_scan, osint_gathering, recon

def run(ip_address):
    print(f"Running in Standard Mode on {ip_address}...")
    network_scan.scan_network(ip_address)
    service_enum.enumerate_services(ip_address)
    vulnerability_scan.scan_vulnerabilities(ip_address)
    osint_gathering.gather_osint(ip_address)
    recon.perform_recon(ip_address)
