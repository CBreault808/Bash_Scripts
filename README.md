# Bash Scripts Repository

## The scripts in this repo start as either assignments from class or ideas that I want to practice and implement in my homelab.

1) weather.sh - This script started as a class bonus assignment. It is designed to give the user a different response depending on temperature. It prompts the user for a temperature between
   -128 degrees and 134 degrees. It then responds with "Hot", "Fine", or "Cold" depending if the input is 76 or higher, between 50 and 76, and 50 or lower, respectively.

2) new_folder.sh - This script was designed to automatically create and rename new directories in the local file system. It first creates the directory with a temporary placeholder name, then prompts
   user to enter a new name for it. The script then moves the user out of the directory, applies the new name, and then moves the user back in. In the event that the user does not input a new name for
   the directory, the script applies a default name "New Directory" along with a counter to avoid overwriting any existing folders. Note: to execute this script, use the command `source ./ new_folder.sh`
