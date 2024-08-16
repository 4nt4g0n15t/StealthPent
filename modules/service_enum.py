import socket

def enumerate_services(ip_address, stealth=False):
    if stealth:
        print(f"Enumerating services on {ip_address} with stealth...")
        # Implement stealth service enumeration
    else:
        print(f"Enumerating services on {ip_address}...")
        # Implement regular service enumeration
