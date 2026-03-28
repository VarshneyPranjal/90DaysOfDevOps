#!/bin/bash

# Defines a list of packages: `nginx`, `curl`, `wget`, Loops through the list, 
# Checks if each package is installed (use `dpkg -s` or `rpm -q`),
# Installs it if missing, skips if already present, Prints status for each package          
# Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.

# Root check (only needed for Linux, not macOS)
if [[ "$OSTYPE" != "darwin" && "$EUID" -ne 0 ]]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

list_of_packages=("nginx" "curl" "wget")           #list_of_packages is an array

for package in "${list_of_packages[@]}"
do
    if command -v "$package" >/dev/null 2>&1; then
        echo "Status - $package already installed"
    else
        echo "Status - $package not found. Installing..."
        brew install "$package"
        echo "Status - $package installed"
    fi
done
