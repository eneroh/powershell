$group = Get-Content "C:\temp\export.txt" | Select-Object -Skip3
$data = Get-Content "C:\temp\export.txt" | Select-Object -Skip3

foreach($group in $data) {
  Write-Host "$group"
  Write-Host
  Get-ADGroupMember -Identity "$group" | Select-Object -Property Name
  Write-Host
  Write-Host
}