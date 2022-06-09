# *** Must add this to $profile or load the below line***
# $fileContents = [string]::join([environment]::newline, (get-content -path ~/cfig/shell/Microsoft.PowerShell_profile.ps1))
# invoke-expression $fileContents

# >> Startup Logo
$date = Get-Date
$time = Get-Date -Format "hh:mm tt"
$whoami = whoami
Write-Host "    __ _   _    _             _   ----------------" -foregroundColor Blue
Write-Host "   /  | \_/ \  (_) _ __    __| |  Never Surrender " -foregroundColor Blue
Write-Host "    | |_   _ \ | || '_ \  / _  |  $($date.ToLongDateString())" -foregroundColor Blue
Write-Host "    | | \_/ \ \| || | | || (_| |  $time" -foregroundColor Blue
Write-Host "    |_|      \/|_||_| |_| \__,_|  ~: $whoami" -foregroundColor Blue
Write-Host "                                  -------------------------" -foregroundColor Blue

# >> Plugins
Import-Module posh-git
Import-Module oh-my-posh
# Install-Module -Name PSFz

# >> Settings
Set-PoshPrompt -Theme Star # Darkblood # Robbyrussell 
Set-PSReadlineOption -EditMode vi -BellStyle None

$env:PATHEXT += ";.py"

# >> Git --bare repo alias
function fig {
  git --git-dir="$HOME\.fig" --work-tree="$HOME" @Args
}

# >> Alias and Vars
$nvim = "C:/Program Files/Neovim/bin/nvim.exe"
Set-Alias -name v -value $nvim

# $qmk = "C:/QMK_MSYS/user/bin/bash.exe"
# Set-Alias -name qmk -value $qmk

Set-Alias -name upT -value Get-Uptime
Set-Alias -name .c -value clear

$cd = "..\"
Function cdPath {Set-Location -Path $cd}
Set-Alias -name .. -value cdPath

$cdd = "..\..\"
Function cddPath {Set-Location -Path $cdd}
Set-Alias -name ... -value cddPath

# $vrc= "~/cfig/_vimrc"
$vrc= "%userprofile%/AppData/Local/nvim/init.vim"

Function profilePath {v $profile}
Set-Alias -name .p -value profilePath

$fws = "D:\websites\"
Function wsPath {Set-Location -Path $fws}
Set-Alias -name fws -value wsPath

$fcf = "~\cfig\"
Function configPath {Set-Location -Path $fcf}
Set-Alias -name fcf -value configPath

# $qmk = "C:\QMK_MSYS\conemu\ConEmu64.exe"
# Function qmkTerminal {Set-Location -Path $qmk}
# Set-Alias -name qmk -value qmkTerminal

Function nukenode {Get-ChildItem -Path "." -Include "node_modules" -Recruse -Directory | Remove-Item -Recruse -Force}
Set-Alias -name nukenode -value nukenode

# $prof = "~\cfig\.shell\Microsoft.PowerShell_profile.ps1"

$ahkScript = "~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\capsEsacpeSwitch.ahk"
$nostromo = "~\AppData\Roaming\Belkin\Nostromo\Profiles\*.*"
$keysticks = "~\Documents\Keysticks\Profiles\*.*"
