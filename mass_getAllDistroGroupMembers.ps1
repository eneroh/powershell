$group = Get-Content "<path>"
$data = Get-Content "<path>"

ForEach($group in data) {
  Get-DistributionGroupMember -Identity "$group" -ResultSize Unlimited
}