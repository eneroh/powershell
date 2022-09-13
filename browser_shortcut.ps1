$url1 = ""
$url2 = ""
$url3 = ""

[System.Diagnostics.Process]::Start("chrome.exe","--incognito $url1 $url2 $url3")
