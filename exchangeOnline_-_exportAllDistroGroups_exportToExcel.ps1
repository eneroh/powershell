### getAllDistroGroups_exportToExcel.ps1 ###

# requires modules
# import-excel
# ExchangeOnlineManagement

Get-DistributionGroup -ResultSize Unlimited | Select-Object -Property Name | Export-Excel -Path "<path>"