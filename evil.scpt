#!/bin/bash

# Define the content of the embedded Bash script
embedded_script="#!/bin/bash
# Function to get the computer's serial number
get_serial_number() {
  serial=\$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print \$4}')
  echo \"Serial Number: \$serial\"
}

# Function to get the computer's OS version
get_os_version() {
  os_version=\$(sw_vers -productVersion)
  echo \"OS Version: \$os_version\"
}

# Output file
output_file=\"/tmp/system_info.txt\"

# Run the functions and store the results in the output file
(get_serial_number && get_os_version) > \"\$output_file\"

# Give some time for the background jobs to finish
sleep 2

# Check if the background jobs are still running and wait for them to finish
while [ \"\$(jobs -r)\" != \"\" ]; do
  sleep 1
done

echo \"System information saved to \$output_file\""

# Save the embedded script to a file
embedded_script_file="/tmp/embedded_script.sh"
echo "$embedded_script" > "$embedded_script_file"

# Make the embedded script executable
chmod +x "$embedded_script_file"

# Run the embedded script
"$embedded_script_file"
