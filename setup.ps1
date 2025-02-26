$projectName = Read-Host "Project name"

$filesToUpdate = @(
    "Properties\AssemblyInfo.cs",
    "JumpKingModTemplate.sln",
    "JumpKingModTemplate.csproj",
    "ModEntry.cs"
)

foreach ($file in $filesToUpdate) {
    if (Test-Path $file) {
        (Get-Content $file) | ForEach-Object { $_ -replace "JumpKingModTemplate", $projectName } | Set-Content $file
        Write-Host "Updated $file with project name"
    }
    else {
        Write-Host "File not found: $file"
    }
}

$slnFile = "./JumpKingModTemplate.sln"
$csprojFile = "./JumpKingModTemplate.csproj"
if (Test-Path $slnFile) {
    Rename-Item -Path $slnFile -NewName "$projectName.sln"
    Write-Host "Renamed JumpKingModTemplate.sln to $projectName.sln"
}

if (Test-Path $csprojFile) {
    Rename-Item -Path $csprojFile -NewName "$projectName.csproj"
    Write-Host "Renamed JumpKingModTemplate.csproj to $projectName.csproj"
}

$debugPath = Read-Host "Path for level debug (C:\path\to\level\bin\)"

$runXmlPath = ".run\Debug.run.xml"
if (Test-Path $runXmlPath) {
    (Get-Content $runXmlPath) | ForEach-Object { $_ -replace "C:\\Users\\elmousse\\Documents\\_pv\\jump king\\levels\\mylevel\\bin\\", $debugPath } | Set-Content $runXmlPath
    Write-Host "Updated $runXmlPath with the provided debug path"
}
else {
    Write-Host "File not found: $runXmlPath"
}

Write-Host "Project ready!"

