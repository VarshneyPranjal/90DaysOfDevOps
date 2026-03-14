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

2. Create `file_check.sh` that:
   - Asks for a filename
   - Checks if the file **exists** using `-f`
   - Prints appropriate message
- Answer:


---

### Task 5: Combine It All
Create `server_check.sh` that:
1. Stores a service name in a variable (e.g., `nginx`, `sshd`)
2. Asks the user: "Do you want to check the status? (y/n)"
3. If `y` — runs `systemctl status <service>` and prints whether it's **active** or **not**
4. If `n` — prints "Skipped."
- Answer:


---