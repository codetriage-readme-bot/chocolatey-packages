﻿$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = "$toolsPath\dilay-1.6.1.msi"
  softwareName   = 'dilay*'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

ls $toolsPath\*.msi | % { rm $_ -ea 0; if (Test-Path $_) { sc "$_.ignore" } }
