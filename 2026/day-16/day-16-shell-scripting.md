## Challenge Tasks

### Task 1: Your First Script
1. Create a file `hello.sh`
2. Add the shebang line `#!/bin/bash` at the top
3. Print `Hello, DevOps!` using `echo`
4. Make it executable and run it
- Answer: 
    ```bash
    #!/bin/bash
    echo "Hello, DevOps!"
    ```

    **Document:** What happens if you remove the shebang line?
- Answer. Nothing happens !!

---

### Task 2: Variables
1. Create `variables.sh` with:
   - A variable for your `NAME`
   - A variable for your `ROLE` (e.g., "DevOps Engineer")
   - Print: `Hello, I am <NAME> and I am a <ROLE>`

- Answer:
    ```bash
    #!/bin/bash
    NAME="Pranjal Varshney"
    role="Golang Developer"
    echo "Hello, I am $NAME and I am a $role"
    ```

    ![variables.png](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-16/variables.png)

2. Try using single quotes vs double quotes — what's the difference?

- Answer: During variables initialization there is no difference but if we use single quotes with echo it does not takes variable values. 

    ```bash
        #!/bin/bash
        NAME="Pranjal Varshney"
        role="Golang Developer"
        echo 'Hello, I am $NAME and I am a $role'
    ```

    Terminal Output :

    ![echoError.png](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-16/echoError.png)

---

### Task 3: User Input with read
1. Create `greet.sh` that:
   - Asks the user for their name using `read`
   - Asks for their favourite tool
   - Prints: `Hello <name>, your favourite tool is <tool>`
- Answer:
    ```bash
    #!/bin/bash
    read -p "Enter name: " NAME
    read -p "Your favourite tool: " tool
    echo "Hello $NAME, your favourite tool is $tool"
    ```

    Terminal Output:

    ![read.png](https://github.com/VarshneyPranjal/90DaysOfDevOps/blob/master/2026/day-16/read.png)

---

### Task 4: If-Else Conditions
1. Create `check_number.sh` that:
   - Takes a number using `read`
   - Prints whether it is **positive**, **negative**, or **zero**
- Answer:
    ```bash 
    #!/bin/bash

    # Check Number entered by user is Positive, Negative or zero. 

    read -p "Enter Number :" Number         #taking input from user
    if [ $Number -gt 0 ];then
        echo "Number is Positive"
    elif [ $Number -lt 0 ]; then
        echo "Number is Negative"
    else
        echo "Number is Zero"
    fi
    ```

2. Create `file_check.sh` that:
   - Asks for a filename
   - Checks if the file **exists** using `-f`
   - Prints appropriate message
- Answer:
    ```bash 
    #!/bin/bash 

    # check if given input file exists or not.

    read -p "Enter the filename: " fileName

    if [ -f $fileName ]; then 
        echo "File exists"
    else 
        echo "File doesn't exist"
    fi
    ```

---

### Task 5: Combine It All
Create `server_check.sh` that:
1. Stores a service name in a variable (e.g., `nginx`, `sshd`)
2. Asks the user: "Do you want to check the status? (y/n)"
3. If `y` — runs `systemctl status <service>` and prints whether it's **active** or **not**
4. If `n` — prints "Skipped."
- Answer:
```bash
#!/bin/bash

#stores a service name as a variable and ask user if they want to check the status of that service 

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
```
---

## What I learned -

* How to write and execute Bash shell scripts using the shebang (`#!/bin/bash`),variables,and user input with `read`.
* How variable assignment works in Bash,including accessing variables with `$` and understanding single vs double quotes.
* How to control script flow using conditional statements (`if`, `elif`, `else`) and test operators (`-f`, `-gt`, `-lt`).
* How to check file existence and numeric conditions inside shell scripts.
* How to suppress command output using redirection (`> /dev/null `).
* How to use `systemctl is-active` to programmatically check whether a service is running instead of relying on verbose status output.