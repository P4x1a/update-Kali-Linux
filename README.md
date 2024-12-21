# 🛠️ Kali Linux Update Automation Script

Welcome to the Kali Linux Update Automation Script repository. This project is designed to simplify the maintenance and update process of the Kali Linux system using a Bash script.

## Description

This project includes a script (`update_kali.sh`) that:
1. Updates the package list.
2. Upgrades installed packages.
3. Performs a distribution upgrade.
4. Removes unnecessary packages.
5. Cleans the package cache.
6. Offers an interactive menu for selecting individual or all operations.

## How to Use

1. Download the raw `update_kali.sh` script from GitHub:
    - [Download update_kali.sh](https://github.com/P4x1a/update-Kali-Linux/blob/main/update_kali.sh)

2. Open a terminal and navigate to the directory where the script was downloaded.

3. Make the script executable:
    ```bash
    chmod +x update_kali.sh
    ```

4. Execute the script:
    ```bash
    ./update_kali.sh --menu
    ```

## Script

### update_kali.sh

```bash
#!/bin/bash

# Function to show the script usage
show_usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -m, --menu           Display interactive menu"
    echo "  -u, --update         Update package list"
    echo "  -g, --upgrade        Upgrade installed packages"
    echo "  -d, --dist-upgrade   Perform distribution upgrade"
    echo "  -r, --remove         Remove unnecessary packages"
    echo "  -c, --clean          Clean package cache"
    echo "  -a, --all            Perform all the above operations"
    echo "  -h, --help           Show this help"
}

# Functions for each operation
update_package_list() {
    echo "Updating package list..."
    sudo apt-get update
}

upgrade_installed_packages() {
    echo "Upgrading installed packages..."
    sudo apt-get upgrade -y
}

distribution_upgrade() {
    echo "Performing distribution upgrade..."
    sudo apt-get dist-upgrade -y
}

remove_unnecessary_packages() {
    echo "Removing unnecessary packages..."
    sudo apt-get autoremove -y
}

clean_package_cache() {
    echo "Cleaning package cache..."
    sudo apt-get clean
}

# Function to perform all operations
perform_all_operations() {
    update_package_list
    upgrade_installed_packages
    distribution_upgrade
    remove_unnecessary_packages
    clean_package_cache
}

# Interactive menu
display_menu() {
    echo "Choose an option below:"
    echo "1. Update package list"
    echo "2. Upgrade installed packages"
    echo "3. Perform distribution upgrade"
    echo "4. Remove unnecessary packages"
    echo "5. Clean package cache"
    echo "6. Perform all the above operations"
    echo "0. Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1) update_package_list ;;
        2) upgrade_installed_packages ;;
        3) distribution_upgrade ;;
        4) remove_unnecessary_packages ;;
        5) clean_package_cache ;;
        6) perform_all_operations ;;
        0) exit 0 ;;
        *) echo "Invalid option"; display_menu ;;
    esac
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

# Process arguments
while [ "$1" != "" ]; do
    case $1 in
        -m | --menu )            display_menu; exit 0 ;;
        -u | --update )          update_package_list ;;
        -g | --upgrade )         upgrade_installed_packages ;;
        -d | --dist-upgrade )    distribution_upgrade ;;
        -r | --remove )          remove_unnecessary_packages ;;
        -c | --clean )           clean_package_cache ;;
        -a | --all )             perform_all_operations ;;
        -h | --help )            show_usage; exit 0 ;;
        * )                      echo "Invalid option: $1"; show_usage; exit 1 ;;
    esac
    shift
done

echo "System updated successfully!"
```

## CONTRIBUTION

Contributions are welcome! Please follow these steps to contribute:
1. Fork the project.
2. Create a new branch:
    ```bash
    git checkout -b feature/AmazingFeature
    ```
3. Commit your changes:
    ```bash
    git commit -m 'Add some AmazingFeature'
    ```
4. Push to the branch:
    ```bash
    git push origin feature/AmazingFeature
    ```
5. Open a Pull Request.

## License

This project is licensed under the [MIT License](LICENSE).

---

Thank you for checking out this project! If you have any questions or suggestions, feel free to contact me.

---

If you need anything else, just let me know! 😊🚀
