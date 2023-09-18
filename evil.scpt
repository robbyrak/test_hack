-- Get the computer's serial number
set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}'"

-- Get the computer's OS version
set osVersion to do shell script "sw_vers -productVersion"

-- Define the path to the tmp directory and the filename for storing the information
set tmpDirectory to "/tmp/"
set filename to "computer_info.txt"
set filePath to (tmpDirectory & filename)

-- Create a new file and write the serial number and OS version to it
do shell script "echo 'Serial Number: " & serialNumber & "' > " & quoted form of filePath
do shell script "echo 'OS Version: " & osVersion & "' >> " & quoted form of filePath

-- Return the path to the created file for reference
return filePath

