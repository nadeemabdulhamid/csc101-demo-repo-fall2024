#!/bin/bash

# File to monitor
file_to_monitor="test.txt"

# Log file to append date and time
log_file="class02-log.txt"

echo "Monitoring $file_to_monitor"

# Initialize the last modification time variable
last_mod_time=$(stat -c %Y "$file_to_monitor")

while true; do
    # Get the current modification time
    current_mod_time=$(stat -c %Y "$file_to_monitor")
    
    # Check if the modification time has changed
    if [ "$current_mod_time" != "$last_mod_time" ]; then
        # Update the last modification time
        last_mod_time=$current_mod_time
        
        # Append the current date and time to the log file
        echo "$(date): $file_to_monitor was modified." >> "$log_file"
        echo "."
    fi
    
    # Sleep for a short interval before checking again
    sleep 2
done
