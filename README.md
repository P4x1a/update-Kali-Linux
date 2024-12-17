# 🛠️ Kali Linux Update Automation Script

Welcome to the Kali Linux Update Automation Script repository. This project is designed to simplify the maintenance and update process of the Kali Linux system using a Bash script.

## Description

This project includes a script (`update_kali.sh`) that:
1. Updates the package list.
2. Upgrades installed packages.
3. Performs a distribution upgrade.
4. Removes unnecessary packages.
5. Cleans the package cache.

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
    ./update_kali.sh
    ```

## Script

### update_kali.sh

```bash
#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt-get upgrade -y

# Perform distribution upgrade
echo "Performing distribution upgrade..."
sudo apt-get dist-upgrade -y

# Remove unnecessary packages
echo "Removing unnecessary packages..."
sudo apt-get autoremove -y

# Clean package cache
echo "Cleaning package cache..."
sudo apt-get clean

echo "System updated successfully!"
```
### CONTRIBUTION_LICENSE.md (English)

```markdown
## Contribution

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

