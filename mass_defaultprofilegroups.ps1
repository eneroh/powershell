$groups = "","","","$office`<group>"
$user = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
$data = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
#$group = Get-Content %USERPROFILE%\Desktop\groups.txt
$office = Read-Host -Prompt 'Input the office: '
foreach($user in $data) {
  Add-ADPrincipalGroupMembership $user -memberof $groups
}

#$group is there as a static way to add groups, adding groups can simply be done via this powershell script too, make sure to uncomment the 
#group of course if you prefer the former.
#This script is a larger part of a whole I am working on. Further automating the process for new user creation for on-prem and potentially cloud.
#The script pointing to a user txt doc also means these user groups can be applied en masse (french for on mass ;))
#The script also has user input to specify an office location, if your AD groups contain multiple office locations of course
