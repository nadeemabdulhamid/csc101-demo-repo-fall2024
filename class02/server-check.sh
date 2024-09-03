#!/bin/bash

# File containing the list of servers
servers_file="servers.txt"

# Loop through each server in the file
while IFS= read -r server; do
    # Check if the line is not empty
    if [ -n "$server" ]; then
        # Ping the server (send 1 packet, wait 1 second for a response)
        if ping -c 1 -W 1 "$server" > /dev/null 2>&1; then
            echo "Server $server is up."
        else
            echo "Server $server is NOT RESPONDING!"
        fi
    fi
done < "$servers_file"
