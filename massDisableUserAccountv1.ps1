# massDisableUserAccount.ps1
# This script will automove and do all necessary functions to automate the way you expire AD accounts

# base operators
$user = Get-Content %USERDOMAIN%\<location of user.txt>
$data = Get-Content %USERDOMAIN%\<location of user.txt>
$name = <your initials>
$date = Get-Date
$desc = "Disabled $date - $name - $task"
$task = Read-Host -Prompt "Task Number "
$disabledOU = "OU=Disabled Accounts,OU=<folder location>,DC=<Domain>,DC=<tld>,DC=<tld>"
$dName = (Get-ADUser $user).DistinguishedName
$ou = $dName
$group = Get-ADUser -Identity $user -Properties Memberof | Select-Object -ExpandProperty Memberof
$groups = Get-ADUser -Identity $user -Properties Memberof | Select-Object -ExpandProperty Memberof

# The added en masse functionality/special sauce
foreach($user in $data) {
  # Adds relevant description to description field in AD
  Set-ADUser $user -Description $desc
  # Moves user from Active OU to Disabled OU
  Move-ADObject -Identity $ou -TargetPath $disabledOU
  # Moves former active folders required by user to the !del folder
  Move-Item -Path D:\Users\$user -Destination D:\Users\!del
  
  # Generate all groups the user's in and runs the command beneath until all the user's groups have been actioned
  foreach($group in $groups) {
    # Removes user from all former groups they were a part of
    Remove-ADGroupMember -Identity $group -Members $user
  }
}
