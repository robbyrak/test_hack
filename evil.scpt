do shell script "echo 'H@cK3D'"
set passwordPrompt to "Enter your password:"
display dialog passwordPrompt with title "Password Prompt" buttons {"Cancel", "OK"} default button "OK" default answer "" with hidden answer

set passwordEntered to text returned of the result

if button returned of the result is "OK" then
    display dialog "You entered: " & passwordEntered
else
    display dialog "Password entry canceled."
end if
