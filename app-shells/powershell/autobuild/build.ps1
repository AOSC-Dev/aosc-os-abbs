$ErrorActionPreference = "Stop";
Import-Module "$env:SRCDIR/build.psm1" -ArgumentList $true;
Start-PSBuild -Output "$env:PKGDIR/usr/lib/powershell" -Configuration "Release" -Detailed -UseNuGetOrg;
Get-Error;
