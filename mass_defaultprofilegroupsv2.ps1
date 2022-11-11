# base statements 
$groups = "","","","$office`<group>"
$user = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
$data = Get-Content %USERPROFILE%\Desktop\<location of txt doc>
#$group = Get-Content %USERPROFILE%\Desktop\groups.txt

#location specific statements (easy expandability)
#$officeINPUT = Read-Host -Prompt 'Input the office (Office Locations): '
$office = Get-ADUser -Identity $user -Properties City | Select-Object -ExpandProperty City
$state = Get-ADUser -Identity $user -Properties State | Select-Object -ExpandProperty State
$locgroup = "<location based group>","<location based group>"

foreach($user in $data) {
  Set-ADUser -Identity $user -Company "<Company Name>" -Office $state

  Add-ADPrincipalGroupMembership $user -memberof $groups
  
  if ($office -eq '<location>') {
    Add-ADPrincipalGroupMembership $user -memberof $locgroup
  }
}
