#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: script2.sh <line_number> <PATTERN>"
    exit 1
fi

# Assign arguments to variables for readability
line_number=$1
pattern=$2

# Loop through all .txt files in the current directory
for file in *.txt; do
    # Check if the file has at least as many lines as the line_number specified
    if [ $(wc -l < "$file") -ge "$line_number" ]; then
        # Extract the specified line from the file
        line_content=$(sed -n "${line_number}p" "$file")

        # Check if the line contains the pattern
        if [[ "$line_content" == *"$pattern"* ]]; then
            echo "$file contains '$pattern' in line $line_number. Deleting $file."
            rm "$file"
        else
            echo "$file does not contain '$pattern' in line $line_number."
        fi
    else
        echo "$file does not have $line_number lines."
    fi
done
