# massDeleteCustomHomeDrive.ps1
# Deletes custom home drive en masse, just add multiple users to user.txt doc

$user = Get-Content %USERPROFILE%\Desktop\<location of user.txt>
$data = Get-Content %USERPROFILE%\Desktop\<location of user.txt>
$listFolder = '[Base Directory where del folder is located]'
$path = $listFolder $user
$destination = '[Directory where the bin is located]'

foreach($user in $data) {
  Move-Item -Path $path -Destination $destination
}
