para($Threshold = 7)
$ThresholdDate = $(Get-Date).AddDays($Threshold)
Get-ADUser -Filter * -Properties * | Where { ($_.AccountExpirationDate -le $ThresholdDate ) -and ($_.AccountExpirationDate -gt $(Get-Date))}
