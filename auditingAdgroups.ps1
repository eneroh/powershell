Get-ADGroup -Filter {name -like "*<keyword>*"} -properties * | Select-Object -ExpandProperty Name
