import modes.standard_mode as standard
import modes.paranoid_mode as paranoid

def main():
    print("Welcome to StealthPent")
    print("Select Mode:")
    print("1. Standard Mode")
    print("2. Paranoid Mode")

    choice = input("Enter your choice (1 or 2): ")
    ip_address = input("Enter the IP address to scan: ")

    if choice == '1':
        standard.run(ip_address)
    elif choice == '2':
        paranoid.run(ip_address)
    else:
        print("Invalid choice. Exiting...")

if __name__ == "__main__":
    main()
