# base statements 
$groups = "","","","$office`<group>"
$user = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
$data = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
#$group = Get-Content %USERPROFILE%\Desktop\groups.txt

#location specific statements (easy expandability)
$office = Read-Host -Prompt 'Input the office (Office Locations): '
$locgroup = "<location based group>","<location based group>"

foreach($user in $data) {
  Add-ADPrincipalGroupMembership $user -memberof $groups
  
  if ($office -eq '<location>' {
    Add-ADPrincipalGroupMembership $user -memberof $locgroup
  }
}
