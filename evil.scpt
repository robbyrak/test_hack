do shell script "sudo security export -k '/Library/Keychains/System.keychain' -o '/tmp/System.keychain-export.keychain'"

if the result is "Exported System keychain contents to /tmp/System.keychain-export.keychain" then
    display dialog "Exported System keychain contents to /tmp/System.keychain-export.keychain"
else
    display dialog "Failed to export System keychain contents"
end if
