# #!/bin/bash

# # stores a service name as a variable and ask user if they want to check the status of that service 

# service_name="nginx"
# read -p "Do you want to check the status? (y/n)" status
# if [ $status == "y" ]; then
#     echo "Checking status of $service_name..."
#     # Try systemctl first, fall back to service command if necessary
#     if command -v systemctl >/dev/null 2>&1; then
#         systemctl status $service_name
#     else
#         echo "Error: systemctl command not found. Installing..."
#         brew install systemctl
#     fi
#     if systemctl status $service_name; then
#         echo "$service_name is already installed."
#     fi
# else
#     echo "Skipped."
# fi

#!/bin/bash

service_name="nginx"

read -p "Do you want to check the status of $service_name? (y/n): " status

if [[ "$status" == "y" ]]; then
    echo "Checking status of $service_name..."

    # macOS (brew services)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew >/dev/null 2>&1; then
            brew services list | grep "$service_name"
        else
            echo "Homebrew not installed"
        fi

    # Linux with systemd
    elif command -v systemctl >/dev/null 2>&1; then
        systemctl status "$service_name"
    else
        echo "No supported service manager found"
    fi

else
    echo "Skipped."
fi