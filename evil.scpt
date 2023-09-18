set passwordPrompt to "Enter your password:"
display dialog passwordPrompt with title "Password Prompt" buttons {"Cancel", "OK"} default button "OK" default answer ""

set user_password to text returned of the result

if button returned of the result is "OK" then
    display dialog "You entered: " & user_password
else
    display dialog "Password entry canceled."
end if
