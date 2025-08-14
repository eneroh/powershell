# mass_getadgroupsandmembersv2.ps1
# I wrote v1 but them I manipulated chatgpt to add the new line formatting I wanted
# This is truly the final and most evolved version of this script that could possibly exist, I think

$groups = Get-Content "C:\temp\export.txt" | Select-Object -Skip 3

$data = @()

foreach ($group in $groups) {
    # Add group name
    $data += [PSCustomObject]@{
        Type = "Group"
        Name = $group
    }

    # Add members
    $members = Get-ADGroupMember -Identity $group | Select-Object -ExpandProperty Name
    foreach ($member in $members) {
        $data += [PSCustomObject]@{
            Type = "Member"
            Name = $member
        }
    }

    # Add blank line
    $data += [PSCustomObject]@{
        Type = ""
        Name = ""
    }
}

$data | Export-CSV -Path "C:\temp\final.csv" -NoTypeInformation