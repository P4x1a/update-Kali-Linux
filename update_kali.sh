#!/bin/bash

# Function to show the script usage
show_usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -u, --update         Update package list"
    echo "  -g, --upgrade        Upgrade installed packages"
    echo "  -d, --dist-upgrade   Perform distribution upgrade"
    echo "  -r, --remove         Remove unnecessary packages"
    echo "  -c, --clean          Clean package cache"
    echo "  -h, --help           Show this help"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    show_usage
    exit 1
fi

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

# Process arguments
while [ "$1" != "" ]; do
    case $1 in
        -u | --update )          update_package_list
                                 ;;
        -g | --upgrade )         upgrade_installed_packages
                                 ;;
        -d | --dist-upgrade )    distribution_upgrade
                                 ;;
        -r | --remove )          remove_unnecessary_packages
                                 ;;
        -c | --clean )           clean_package_cache
                                 ;;
        -h | --help )            show_usage
                                 exit 0
                                 ;;
        * )                      echo "Invalid option: $1"
                                 show_usage
                                 exit 1
    esac
    shift
done

echo "System updated successfully!"
