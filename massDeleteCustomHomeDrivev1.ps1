# massDeleteCustomHomeDrivev1.ps1
# Script is a precursor to massDeleteCustomHomeDrivev2.ps1

$data = Get-Content [location of text file to place names for action]
$destination = '[Location of del/bin folder]'
$line = Get-Content [location of text file to place names for action] (can be same place as $data)

foreach($line in $data) {
  Move-Item -path %USERPROFILE%\Desktop\$line -destination $destination
}
