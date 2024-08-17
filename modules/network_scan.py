import scapy.all as scapy
import socket
import whois
import datetime
import asyncio

class NetworkScanner:
    def __init__(self, verbose=False):
        self.verbose = verbose

    def scan_ip(self, ip, ports):
        self.ip = ip
        self.ports = self.parse_ports(ports)
        self.results = {
            'open_ports': [],
            'os_fingerprint': self.perform_os_fingerprinting(),
            'whois_data': self.retrieve_whois_data()
        }

        for port in self.ports:
            self.scan_port(port)

        self.save_report()

    def parse_ports(self, ports):
        if ports == 'common':
            return [22, 80, 443, 21, 25]
        elif ports == 'all':
            return range(1, 65536)
        else:
            return [int(p) for p in ports.split(',')]

    def scan_port(self, port):
        if self.verbose:
            print(f"Scanning port {port}...")
        
        syn_packet = scapy.IP(dst=self.ip)/scapy.TCP(dport=port, flags='S')
        response = scapy.sr1(syn_packet, timeout=1, verbose=False)
        
        if response and response.haslayer(scapy.TCP):
            if response.getlayer(scapy.TCP).flags == 0x12:
                scapy.sr1(scapy.IP(dst=self.ip)/scapy.TCP(dport=port, flags='R'), timeout=1, verbose=False)
                service = self.get_service(port)
                self.results['open_ports'].append({'port': port, 'service': service})

    def get_service(self, port):
        try:
            service = socket.getservbyport(port)
        except OSError:
            service = 'unknown'
        return service

    def perform_os_fingerprinting(self):
        try:
            response = scapy.sr1(scapy.IP(dst=self.ip)/scapy.TCP(dport=80, flags='S'), timeout=1, verbose=False)
            if response:
                # Simplified OS fingerprinting
                return "Linux/Unix-based OS"
        except Exception:
            return "Unknown OS"

    def retrieve_whois_data(self):
        try:
            whois_data = whois.whois(self.ip)
            return {
                "domain_name": whois_data.domain_name,
                "registrar": whois_data.registrar,
                "whois_server": whois_data.whois_server,
                "referral_url": whois_data.referral_url,
                "updated_date": whois_data.updated_date,
                "creation_date": whois_data.creation_date,
                "expiration_date": whois_data.expiration_date,
                "name_servers": whois_data.name_servers,
                "status": whois_data.status,
                "emails": whois_data.emails,
                "dnssec": whois_data.dnssec,
                "name": whois_data.name,
                "org": whois_data.org,
                "address": whois_data.address,
                "city": whois_data.city,
                "state": whois_data.state,
                "registrant_postal_code": whois_data.registrant_postal_code,
                "country": whois_data.country
            }
        except Exception:
            return {}

    def save_report(self):
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"reports/{self.ip}_{timestamp}.txt"
        with open(filename, 'w') as f:
            for port in self.results['open_ports']:
                f.write(f"Port {port['port']} is open. Service: {port['service']}\n")
            f.write(f"OS Fingerprint: {self.results['os_fingerprint']}\n")
            f.write(f"WHOIS Data: {self.results['whois_data']}\n")
        if self.verbose:
            print(f"Report saved as {filename}")
