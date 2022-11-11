# mass_defaultprofilegroupsv2.ps1
# V2 and the best one yet, larger but definitely better in this instance

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

# The mass function, for every user located in the user text doc action the command/s below
foreach($user in $data) {
  # Set user's command to <Company Name"
  Set-ADUser -Identity $user -Company "<Company Name>" -Office $state
  # Add user to relevant default groups
  Add-ADPrincipalGroupMembership $user -memberof $groups
  
  # If office is located at <location> provide command below
  if ($office -eq '<location>') {
    # Gives user location based groups
    Add-ADPrincipalGroupMembership $user -memberof $locgroup
  }
}
