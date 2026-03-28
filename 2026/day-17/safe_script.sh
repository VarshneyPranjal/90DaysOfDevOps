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
