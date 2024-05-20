param(
    [string]$dotnetPack = "true"
)

$current_dir = $PSScriptRoot
#get Grandparent directory
$repo_root = Split-Path -Parent (Split-Path -Parent $current_dir)
Write-Host "Repo root: $repo_root"

if (-not(Test-Path "$repo_root/artifacts/packages")) {
    New-Item -Path "$repo_root/artifacts/packages" -ItemType Directory -Force | Out-Null
}

if (-not(Test-Path "$repo_root/artifacts/packages/Sharpliner.43.43.43.nupkg") -and $dotnetPack -ne "false") {
    Write-Host "Building Sharpliner nupkg for Sharpliner.CI..."
    #dotnet pack --nologo "$repo_root/src/Sharpliner/Sharpliner.csproj" -p:PackageVersion=43.43.43 -c:Release
}
