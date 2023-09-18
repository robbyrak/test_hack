set contentToWrite to "#!/bin/bash" & return & "
# Function to get the computer's serial number
get_serial_number() {
  serial=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')
  echo \"Serial Number: $serial\"
}

# Function to get the computer's OS version
get_os_version() {
  os_version=$(sw_vers -productVersion)
  echo \"OS Version: $os_version\"
}

# Output file
output_file=\"/tmp/system_info.txt\"

# Run the functions and store the results in the output file
(get_serial_number && get_os_version) > \"$output_file\"

# Give some time for the background jobs to finish
sleep 2

# Check if the background jobs are still running and wait for them to finish
while [ \"\$(jobs -r)\" != \"\" ]; do
  sleep 1
done

echo \"System information saved to \$output_file\""

set filePath to "/tmp/myfile.sh"

do shell script "printf %s " & quoted form of contentToWrite & " > " & quoted form of filePath

