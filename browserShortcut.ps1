# browserShortcut.ps1
# Browser shortcut script for quick access to 1,2,3 or more tabs at once, presently stuck on chrome but works for different browsers w/ fine tuning

$url1 = ""
$url2 = ""
$url3 = ""

[System.Diagnostics.Process]::Start("chrome.exe","--incognito $url1 $url2 $url3")
