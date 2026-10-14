#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: script1.sh filename1 filename2 ..."
    exit 1
fi

# Loop through all provided arguments
for file in "$@"; do
    if [ -e "$file" ]; then
        # Check if it's a regular file
        if [ -f "$file" ]; then
            # Check if the file has execute permission
            if [ -x "$file" ]; then
                echo "$file is currently executable."
                echo "$(ls -l "$file")"
                
                # Remove execute permissions
                chmod -x "$file"
                echo "$file's executable permission is now changing."
                echo "$(ls -l "$file")"
            else
                echo "$file is currently not executable."
            fi
        else
            echo "$file is not a regular file."
        fi
    else
        echo "$file does not exist."
    fi
done
