#!/bin/bash

# Use find to locate all .cpp files in the current directory and subdirectories
find . -type f -name "*.cpp" | while read -r file; do
    # Generate new file name by replacing .cpp with .c
    new_file="${file%.cpp}.c"
    
    # Rename the file
    mv "$file" "$new_file"
    echo "Renamed $file to $new_file"
done
