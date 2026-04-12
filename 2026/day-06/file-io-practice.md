# Day 6 – Linux File Handling Basics (DevOps)
 
## 1. Create a File

```bash
touch notes.txt
```

**Explanation:**  
Creates an empty file named `notes.txt`.

---

## 2. Write to a File (Overwrite)

```bash
echo "Today is Day 6/90 of my DevOps journey" > notes.txt
```

**Explanation:**  
- `>` writes content to the file  
- If the file already exists, it **overwrites** the content

---

## 3. Append to a File

```bash
echo "Linux file handling practice" >> notes.txt
```

**Explanation:**  
- `>>` appends content to the file  
- Existing content is preserved

---

## 4. Write and Display Output Using tee

```bash
echo "Redirection is powerful" | tee -a notes.txt
```

**Explanation:**  
- `tee` displays output on the terminal  
- `-a` appends the output to the file

---

## 5. View File Content

```bash
cat notes.txt
```

**Explanation:**  
Displays the full content of the file.

---

## 6. Add Multiple Lines Using EOF

```bash
cat <<EOF >> notes.txt
cat reads full file
head reads top lines
tail reads bottom lines
These skills help in DevOps
EOF
```

**Explanation:**  
- `EOF` is a multi-line input method  
- Appends multiple lines at once

---

## 7. View Top Lines (head)

```bash
head notes.txt
```

```bash
head -n 2 notes.txt
```

**Explanation:**  
- Shows the first 10 lines by default  
- `-n` specifies number of lines

---

## 8. View Bottom Lines (tail)

```bash
tail -n 3 notes.txt
```

**Explanation:**  
Displays the last 3 lines of the file.

---

## 9. Search Text Using grep

```bash
cat notes.txt | grep head
```

**Explanation:**  
Filters and shows lines containing the word **head**.


Output:
![file](https://github.com/VarshneyPranjal/90-Days-of-DevOps/blob/main/2026/day-06/notes.png)