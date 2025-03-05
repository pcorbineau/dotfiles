function Test-IsSandbox {
    return ($env:USERNAME -eq 'WDAGUtilityAccount')
}

function Install-Winget {
    $dependencies = "https://github.com/microsoft/winget-cli/releases/download/v1.10.340/DesktopAppInstaller_Dependencies.zip" 
    $outpath = "$env:TEMP\winget-dependencies"
    Invoke-WebRequest -Uri $dependencies -OutFile "$env:TEMP\winget-dependencies.zip"
    Expand-Archive -Path "$env:TEMP\winget-dependencies.zip" -DestinationPath $outpath

    # select arch from arm, arm64, x64, x86 using current arch
    $arch = switch (Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Architecture) {
        5 { "arm" }
        12 { "arm64" }
        9 { "x64" }
        0 { "x86" }
        Default { throw "Unsupported architecture" }
    }
    # select folder according to arch
    $deps_path = $outpath + "\" + $arch
    # for each file in outpath exec Add-AppxPackage
    Get-ChildItem -Path $deps_path -Recurse | ForEach-Object {
        Add-AppxPackage -Path $_.FullName
    }

    # Install winget from aka.ms
    Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile "$env:TEMP\winget-cli.appxbundle"
    Add-AppxPackage -Path "$env:TEMP\winget-cli.appxbundle"

    # Clean up
    Remove-Item -Path "$env:TEMP\winget-dependencies.zip" -Force
    Remove-Item -Path "$env:TEMP\winget-cli.appxbundle" -Force
    Remove-Item -Path "$env:TEMP\winget-dependencies" -Recurse -Force

}
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8;
$Script:ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue;

$progressPreference = 'silentlyContinue'
Install-Winget


winget install -e --id Neovim.Neovim -s winget --silent
winget install -e --id Git.Git -s winget --silent
winget install -e --id=sharkdp.fd -s winget --silent
winget install -e --id=BurntSushi.ripgrep.MSVC -s winget --silent
winget install -e --id=Microsoft.OpenSSH.Beta -s winget --silent
winget install -e --id=GitHub.cli -s winget --silent