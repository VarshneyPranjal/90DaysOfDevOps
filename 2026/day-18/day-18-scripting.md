# Day 18 – Shell Scripting: Functions & intermediate Concepts

## Task
Write cleaner, reusable scripts — learn functions, strict mode, and real-world patterns.

---
### Task 1: Basic Functions
1. Create `functions.sh` with:
   - A function `greet` that takes a name as argument and prints `Hello, <name>!`
   - A function `add` that takes two numbers and prints their sum
   - Call both functions from the script
- Answer: 
    ```bash 
    #!/bin/bash
    greet(){
        if [[ -z "$1" ]]; then      #TRUE if $1 is empty or not provided.
            echo "Please pass your name as an argument."
            echo "Usage: ./functions.sh <your-name> <number1> <number2>" 
            return
        else 
            echo "Hello, $1!"
        fi
    }
    add(){
        if [[ -z "$1" || -z "$2" ]]; then   #TRUE when either $1 or $2 is empty or not provided.
            echo "Please pass two numbers for sum"
            echo "Usage: ./functions.sh <your-name> <number1> <number2>"
            return 
        else
            echo "The sum of $1 and $2 is: $(( $1 + $2 ))"
        fi
    }

    greet "$1"   #take input from user
    add "$2" "$3"  #take input from user

    # greet "rahul"  #hardcoded passed argument
    # add 1 3        #hardcoded passed argument
    ```
---

### Task 2: Functions with Return Values
1. Create `disk_check.sh` with:
   - A function `check_disk` that checks disk usage of `/` using `df -h`
   - A function `check_memory` that checks free memory using `free -h`
   - A main section that calls both and prints the results
- Answer:
    ```bash 
    #!/bin/bash

    check_disk(){
        usage=$(df -h | awk 'NR==2 { print $3 }')
        echo "disk usage of '/' is: $usage"
    }
    check_memory(){
        unused=$(top -l 1 | grep PhysMem | awk '{ print $8 }')
        echo "free physical memory: $unused"
    }
    check_disk
    check_memory
    ```
---

### Task 3: Strict Mode — `set -euo pipefail`
1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?

**Document:** What does each flag do?
- `set -e` →
- `set -u` →
- `set -o pipefail` →

---

### Task 4: Local Variables
1. Create `local_demo.sh` with:
   - A function that uses `local` keyword for variables
   - Show that `local` variables don't leak outside the function
   - Compare with a function that uses regular variables

---

### Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A `main` function that calls all of the above with section headers
7. Use `set -euo pipefail` at the top

---

## Hints
- Function syntax: `function_name() { ... }`
- Local vars: `local MY_VAR="value"`
- Strict mode: `set -euo pipefail` as first line after shebang
- Pass args to functions: `greet "Shubham"` → access as `$1` inside
- `$?` gives the exit code of last command

---

## Documentation

Create `day-18-scripting.md` with:
- Each script's code and output
- Explanation of `set -euo pipefail`
- What you learned (3 key points)

---