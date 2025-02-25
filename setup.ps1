# Prompt the user for the project name
$projectName = Read-Host "Enter the project name"

# Define file paths to be updated
$filesToUpdate = @(
    "Properties\AssemblyInfo.cs",
    "JumpKingModTemplate.sln",
    "JumpKingModTemplate.csproj",
    "ModEntry.cs"
)

# Replace "JumpKingModTemplate" with the project name in the specified files
foreach ($file in $filesToUpdate) {
    if (Test-Path $file) {
        (Get-Content $file) | ForEach-Object { $_ -replace "JumpKingModTemplate", $projectName } | Set-Content $file
        Write-Host "Updated $file with project name"
    } else {
        Write-Host "File not found: $file"
    }
}

# Rename the .sln and .csproj files
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

# Prompt for the level debug path
$debugPath = Read-Host "Enter the level debug path (e.g., C:\path\to\levels\bin)"

# Update the .run/Debug.run.xml with the provided debug path
$runXmlPath = ".run\Debug.run.xml"
if (Test-Path $runXmlPath) {
    (Get-Content $runXmlPath) | ForEach-Object { $_ -replace "C:\\Users\\elmousse\\Documents\\_pv\\jump king\\levels\\mylevel\\bin\\", $debugPath } | Set-Content $runXmlPath
    Write-Host "Updated $runXmlPath with the provided debug path"
} else {
    Write-Host "File not found: $runXmlPath"
}

Write-Host "Script completed successfully!"
