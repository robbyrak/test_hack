-- Get the computer's serial number
set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}'"

-- Get the computer's OS version
set osVersion to do shell script "sw_vers -productVersion"

-- Define the IP address and port to reach out to
set ipAddress to "192.168.1.100"
set port to "8080"

-- Define the path to the tmp directory and the plist filename
set tmpDirectory to "/tmp/"
set plistFilename to "remote_info.plist"
set plistFilePath to (tmpDirectory & plistFilename)

-- Create a plist with serial number, OS version, and IP address
set plistData to ¬
    {¬
        "SerialNumber" : serialNumber,¬
        "OSVersion" : osVersion,¬
        "IPAddress" : ipAddress,¬
        "Port" : port¬
    }

-- Write the plist data to a file
do shell script "echo '" & (plistData as text) & "' > " & quoted form of plistFilePath

-- Return the path to the created plist file for reference
return plistFilePath
