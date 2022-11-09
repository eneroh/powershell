# Default perms for entire folder structuring, great for systems administrators building a ground up on-prem file perms sol.

--- Coming later ---

_____________________________

# createHomeDirv2.ps1
# Don't ask about v1 it's not as good and made by an entirely different person *cough*... Also was a basic af batch script that just created a folder aha

# Simpler honed in file permission set-up for those that already have a default file/folder permissions ACL base

# Base operators
$user = %USERPROFILE%/DESKTOP/user.txt
$parent = "Parent Directory"
$dir = Actual dir of users custom directory
$main = "Network Drive user location"
$permission = $user, 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow'
$object = New-Object System.Security.Principal.Ntaccount("$user")
$acl = Get-Acl $dir

# Gives user required H drive letter tied to their AD account
New-Item -ItemType directory -Path $dir
Set-ADUser -Identity $user -HomeDirectory ($user) -HomeDrive "H:"

# Give domain\user full access to individual folder, as well as presents permissions to relevant parties i.e. default accounts and already present ACLs
$fileSystemAccessFule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permission
$acl.SetAccessRule($fileSystemAccessRule)
$acl.SetOwner($object)

# Inherit permissions from parent folder (not as useful)
#$acl.SetACcessRuleProtection($true, $false)

# Copy perms from another folder to specified (may be useful later)
#Get-Acl $parent | Set-Acl -path $dir

# Apply the updated folder permissions
$acl | Set-Acl -Path $dir

# Set-up smb sharing and permissions as per procedure
New-SmbShare -Name $user$ -Path $dir -FullAccess $user
________________________________
# Shoutouts/Inspiration

# shoutout to doc: (helped me gain a srs understanding around powershell acls)
# https://ss64.com/ps/set-acl.html

# shoutout to doc: (helped me understand like 1 line specifically line 37 smbshares aha)
# https://mcpmag.com/articles/2017/07/13/creating-shares-in-windows-using-the-smbshare-module.aspx
