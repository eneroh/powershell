# massdisableExpiredUserAccount.ps1
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

foreach($user in $data) {
  Set-ADUser $user -Description $desc
  Move-ADObject -Identity $ou -TargetPath $disabledOU
  Move-Item -Path D:\Users\$user -Destination D:\Users\!del
  
  foreach($group in $groups) {
    Remove-ADGroupMember -Identity $group -Members $user
  }
}
