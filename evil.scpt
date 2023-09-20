#!/bin/bash

# Define the output file path
output_file="/tmp/System.keychain-export.keychain"

# Export the contents of the System keychain to the specified file
security export -k "/Library/Keychains/System.keychain" -o "$output_file"

if [ $? -eq 0 ]; then
    echo "Exported System keychain contents to $output_file"
else
    echo "Failed to export System keychain contents"
fi
