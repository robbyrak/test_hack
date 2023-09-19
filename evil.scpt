-- Get the computer's serial number
set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}'"

-- Get the operating system version
set osVersion to do shell script "sw_vers -productVersion"

-- Define the path to the output file
set tmpDirectory to "/tmp/"
set outputFilePath to tmpDirectory & "system_info.txt"

-- Create strings for the serial number and operating system version
set serialInfo to "Serial Number: " & serialNumber
set osInfo to "Operating System Version: " & osVersion

-- Combine both pieces of information with a line break
set systemInfo to serialInfo & return & osInfo

-- Write the data to the output file
do shell script "echo " & quoted form of systemInfo & " > " & quoted form of POSIX path of outputFilePath

-- Return the path to the output file
return outputFilePath

