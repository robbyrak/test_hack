set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}'"
set osVersion to do shell script "sw_vers -productVersion"
set tmpDirectory to "/tmp/"
set plistFilename to "remote_info.plist"
set plistFilePath to (tmpDirectory & plistFilename)
set infoRecord to {OSVersion:osVersion, SerialNumber:serialNumber}

set plistData to infoRecord as plist
do shell script "echo '" & (plistData as text) & "' > " & quoted form of plistFilePath

return plistFilePath
