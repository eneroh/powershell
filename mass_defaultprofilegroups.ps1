$groups = "","","","$office`<group>"
$user = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
$data = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
#group = Get-Content %USERPROFILE%\Desktop\groups.txt
$office = Read-Host -Prompt 'Input the office: '
foreach($user in $data) {
  Add-ADPrincipalGroupMembership $user -memberof $groups
}
