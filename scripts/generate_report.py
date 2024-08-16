import json
import os

def load_scan_results():
    # Simulated data from previous scan
    return {
        "open_ports": [22, 80, 443],
        "services": {
            22: "SSH",
            80: "HTTP",
            443: "HTTPS"
        },
        "vulnerabilities": {
            80: ["CVE-2022-1234", "CVE-2022-5678"]
        },
        "osint": {
            "domain": "example.com",
            "whois": "Public WHOIS information",
            "dns_records": ["A record", "MX record"]
        }
    }

def generate_report(format="text"):
    data = load_scan_results()
    
    if format == "json":
        report = json.dumps(data, indent=4)
        report_file = "reports/report.json"
    else:
        report = "\n".join([f"{k}: {v}" for k, v in data.items()])
        report_file = "reports/report.txt"
    
    os.makedirs("reports", exist_ok=True)
    with open(report_file, "w") as f:
        f.write(report)
    
    print(f"Report generated at {report_file}")

if __name__ == "__main__":
    generate_report(format="text")
