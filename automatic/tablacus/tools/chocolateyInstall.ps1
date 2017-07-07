﻿$ErrorActionPreference = 'Stop';

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = 'tablacus'
  file        = "$toolsPath\te170706.zip"
  destination = "$toolsPath"
}

Get-ChocolateyUnzip @packageArgs

rm "$toolsPath\*.zip" -ea 0 -Force