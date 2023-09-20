set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}'"
set osVersion to do shell script "sw_vers -productVersion"
set tmpDirectory to "/tmp/"
set outputFilePath to tmpDirectory & "system_info.txt"
set serialInfo to "Serial Number: " & serialNumber
set osInfo to "Operating System Version: " & osVersion
set systemInfo to serialInfo & return & osInfo
do shell script "echo " & quoted form of systemInfo & " > " & quoted form of POSIX path of outputFilePath
return outputFilePath
