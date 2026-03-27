if ((Test-Path /etc/powershell.d/)) {
    foreach ($script in Get-ChildItem /etc/powershell.d/*.ps1) {
        . $script
    }
}

if ((Test-Path /usr/share/powershell/completions)) {
    foreach ($script in Get-ChildItem /usr/share/powershell/completions/*.ps1) {
        . $script
    }
}
