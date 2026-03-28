## Day 17 – Shell Scripting: Loops, Arguments & Error Handling

### Task
Level up your scripting — use loops, handle arguments, and deal with errors.

#### Task 1: For Loop
1. Create `for_loop.sh` that:
   - Loops through a list of 5 fruits and prints each one
```bash 
#!/bin/bash

# Prints each element of a list 

for fruit in apple mango tomato banana orange
do 
    echo $fruit
done 
```

2. Create `count.sh` that:
   - Prints numbers 1 to 10 using a for loop
```bash 
#!/bin/bash

#count number from 1 to 10 using FOR loop

for (( num=1; num<=10; num++ ))
do
    echo $num
done

# for (( num=1; num<=10; num++ )); do echo ${num}; done        #in one line
```
---

#### Task 2: While Loop
1. Create `countdown.sh` that:
   - Takes a number from the user
   - Counts down to 0 using a while loop
   - Prints "Done!" at the end
```bash 
#!/bin/bash

# Takes a number from user, countdown to 0 using a WHILE loop, and print "Done!" at the end.

read -p "enter a number: " Number

while [ $Number -ge 0 ] 
do 
    echo $Number
    ((Number--))
done
echo "Done!"
```
---

#### Task 3: Command-Line Arguments
1. Create `greet.sh` that:
   - Accepts a name as `$1`
   - Prints `Hello, <name>!`
   - If no argument is passed, prints "Usage: ./greet.sh <name>"
```bash 
#!/bin/bash

# Accepts a name as `$1`, Prints `Hello, <name>!`, If no argument is passed, prints "Usage: ./greet.sh <name>"

if [ $# -eq 0 ]; then 
    echo "Please pass your name as an argument"
    echo "Usage: ./greet.sh <name>"
else
    echo "Hello, $1!"
fi
```
2. Create `args_demo.sh` that:
   - Prints total number of arguments (`$#`)
   - Prints all arguments (`$@`)
   - Prints the script name (`$0`)
```bash
#!/bin/bash

# Prints total number of arguments (`$#`), Prints all arguments (`$@`), Prints the script name (`$0`)

echo "Prints total number of arguments:" $#
echo "Prints all arguments:" $@
echo "Prints the script name:" $0
```
---

#### Task 4: Install Packages via Script
1. Create `install_packages.sh` that:
   - Defines a list of packages: `nginx`, `curl`, `wget`
   - Loops through the list
   - Checks if each package is installed (use `dpkg -s` or `rpm -q`)
   - Installs it if missing, skips if already present
   - Prints status for each package

```bash
#!/bin/bash

# Defines a list of packages: `nginx`, `curl`, `wget`, Loops through the list, 
# Checks if each package is installed (use `dpkg -s` or `rpm -q`),
# Installs it if missing, skips if already present, Prints status for each package          

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
```
---

#### Task 5: Error Handling
1. Create `safe_script.sh` that:
   - Uses `set -e` at the top (exit on error)
   - Tries to create a directory `/tmp/devops-test`
   - Tries to navigate into it
   - Creates a file inside
   - Uses `||` operator to print an error if any step fails

```bash
#!/bin/bash 

#Uses `set -e` at the top (exit on error), Tries to create a directory `/tmp/devops-test`,
#Tries to navigate into it, Creates a file inside, Uses `||` operator to print an 
#error if any step fails

set -e 
mkdir tmp/devops-test || { echo "Directory already exists"; exit 1; }
# cd /non-existent-folder       # Script STOPS here immediately because of `set -e` usage.
cd tmp/devops-test/ || { echo "failed to navigate to "/devops-test/" directory"; exit 1; } #error handling
touch devOps.txt || { echo "failed to create a file named "devOps.txt" inside this directory"; exit 1; }
echo "file created successfully"

# Key-findings:
#In Bash, set -e has a specific rule: it is ignored for any command 
#that is part of a logical OR (||) or AND (&&) list.
```

2. Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.
```bash 
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
```
---

### What I learned
* Learned how to use loops to iterate over lists and number ranges
* Learned how to use while loops for countdown logic with user input
* Handled command-line arguments using $1,$#, $@, $0
* Automated package installation (nginx, curl, wget)
* Added root user validation using $EUID
* Implemented error handling with set -e and ||

