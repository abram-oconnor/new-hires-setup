﻿#Prompts for user input regarding credentials for new profile. 
$Username = Read-Host -Prompt 'What is the username for the profile?'
$Password = Read-Host -Prompt 'Input new user password.' -AsSecureString
$Computername = Read-Host -Prompt 'Input new computer name.'

#Creates new user profile using previous inputs.
New-LocalUser $Username -Password $Password

#Adds new user profile to local Admin group
Add-LocalGroupMember -Group "Administrators" -Member $Username

Write-Host "The new profile named" $Username "has been created with the password you specified, the user profile is set to Administrator."

#Disables script execution
Set-ExecutionPolicy Restricted 