-- Define the path to the /Applications directory
set appsDirectory to POSIX file "/Applications" as alias

-- Define the file name and content
set fileName to "evil.sh"
set fileContent to "#!/bin/bash\n\necho 'This is an evil script'"

-- Create the file
set filePath to appsDirectory & fileName as text
try
    set fileRef to (open for access filePath with write permission)
    write fileContent to fileRef as «class utf8»
    close access fileRef
    display dialog "File 'evil.sh' created in /Applications directory." buttons {"OK"} default button "OK"
on error errMsg
    display dialog "Error: " & errMsg buttons {"OK"} default button "OK"
end try
