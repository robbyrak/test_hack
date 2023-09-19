-- Get the computer's serial number
set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}'"

-- Get the operating system version
set osVersion to do shell script "sw_vers -productVersion"

-- Define the path to the output file
set tmpDirectory to "/tmp/"
set outputFilePath to tmpDirectory & "system_info.txt"

-- Create a string containing the collected data
set systemInfo to "Operating System Version: " & osVersion & return & "Serial Number: " & serialNumber

-- Write the data to the output file
do shell script "echo " & quoted form of systemInfo & " > " & quoted form of POSIX path of outputFilePath

-- Return the path to the output file
return outputFilePath

