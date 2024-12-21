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

# Check for dpkg interruptions and fix them
check_and_fix_dpkg() {
    echo "Checking and fixing dpkg interruptions..."
    sudo dpkg --configure -a
    sudo apt-get check
    if [ $? -ne 0 ]; then
        echo "There are broken packages. Please fix them manually."
        exit 1
    fi
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

# Ensure dpkg configuration is fixed before proceeding
check_and_fix_dpkg

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
