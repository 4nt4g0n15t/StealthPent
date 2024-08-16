import requests

def perform_recon(ip_address, stealth=False):
    if stealth:
        print(f"Performing reconnaissance on {ip_address} with stealth...")
        # Implement stealth reconnaissance
    else:
        print(f"Performing reconnaissance on {ip_address}...")
        # Implement regular reconnaissance
