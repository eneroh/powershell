# mass_getadgroupsandmembersv1.ps1
# this script does the goal I wanted, however  didnt add a new line in between groups and its relevant members
# formatting wasn't to my liking
# fixed with v2 and chatgpt

$groups = Get-Content "C:\temp\export.txt" | Select-Object -Skip 3

$data = foreach($group in $groups)
{
  Get-ADGroup -Identity "$group" | Select-Object -Property Name | Sort Name
  Get-ADGroupMember -Identity "$group" | Select-Object -Property Name | Sort Name
}
$data | Export-CSV -Path "C:\temp\final.csv" -NoTypeInformation