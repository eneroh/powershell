# inputDeleteCustomHomeDrive.ps1
# Delete singular inputted user's home drive

$user = Read-Host -Prompt 'Input the user name'
$listFolder = '[Base Directory where del folder is located]'
$path = $listFolder $user
$destination = '[Directory where the bin is located]'

Move-Item -path $path -destination $destination
