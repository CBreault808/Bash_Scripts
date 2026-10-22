# Weather Temperature Script (`weather.sh`)

This is a Bash shell script designed to evaluate a user-inputted temperature and classify it into specific categories based on defined thresholds, while enforcing strict input validation.

---

## 📋 Assignment Requirements & Implementation

The script accurately satisfies all parameters provided in the assignment instructions:

| Instructor Requirement | Script Implementation |
| :--- | :--- |
| **Prompt user for temp between -128 and 134** | Uses `read -rp` to prompt the user and explicitly states the valid range. |
| **Below 50 outputs "Cold"** | Evaluated via `-lt 50` check. |
| **Between 50 and 75 outputs "Fine"** | Evaluated via `-lt 76` check. |
| **76 or higher outputs "Hot"** | Evaluated via the catching `else` block. |
| **Invalid integers output "Error"** | Handled using a Regular Expression (`=~ ^-?[0-9]+$`) to catch strings, symbols, empty entries, and decimal numbers. It also throws an error if a valid integer falls outside the `-128` to `134` boundaries. |

---

## 🛠️ How It Works (The Code Logic)

The script processes user input through a top-down evaluation loop:

1. **Input Validation (Regex Check):** The script first checks if the input contains *only* numbers (and an optional negative sign). If a user enters letters, spaces, or decimals, it triggers an `Error`.
2. **Boundary Check:** If it passes the regex check, it evaluates if the number is less than `-128` or greater than `134`. If it is outside this range, it triggers an `Error`.
3. **Temperature Classification:** If the data is a safe, valid integer within the bounds, it cascades down the `if/elif/else` statements to print the correct category (`Cold`, `Fine`, or `Hot`).

---

## 🚀 How to Run the Script

To execute this script in a Linux environment or Linux container, use the following commands in your terminal:

1. **Make the script executable:**
   ```bash
   chmod +x weather.sh
   ```

2. **Run the script:**
   ```bash
   ./weather.sh
   ```
