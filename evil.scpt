set contentToWrite to "H@cK3D"
set filePath to "/tmp/myfile.txt"

do shell script "echo " & quoted form of contentToWrite & " > " & quoted form of filePath
