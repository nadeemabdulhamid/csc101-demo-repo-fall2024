#!/bin/bash

# Number of files to create
num_files=10

# Directory to create files in (current directory by default)
output_dir="."

# Loop to create files
for ((i = 1; i <= num_files; i++)); do
    # Generate a random file name with spaces
    file_name="File $(date +%s%N | cut -b1-13) $(od -vAn -N4 -tu4 < /dev/urandom | tr -d ' ')"

    # Create the file with the random name
    touch "${output_dir}/${file_name}.txt"
    
    # Optionally write random content to the file
    echo "Random content for ${file_name}" > "${output_dir}/${file_name}.txt"
done

echo "$num_files files created in $output_dir"
