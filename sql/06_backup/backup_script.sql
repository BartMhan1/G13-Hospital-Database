# =========================================================
# G13 HOSPITAL DATABASE - FULL BACKUP SCRIPT
# =========================================================

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupFile = "G13_hospital_db_$timestamp.sql"

# Try to locate mysqldump automatically
$mysqldump = Get-Command mysqldump -ErrorAction SilentlyContinue

# If it is not in PATH, check common MySQL installation locations
if (-not $mysqldump) {

    $possiblePaths = @(
        "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe",
        "C:\Program Files\MySQL\MySQL Workbench 8.0\mysqldump.exe"
    )

    foreach ($path in $possiblePaths) {
        if (Test-Path $path) {
            $mysqldump = $path
            break
        }
    }
}

# Stop if mysqldump cannot be found
if (-not $mysqldump) {
    Write-Host "ERROR: mysqldump.exe was not found."
    Write-Host "Install MySQL Server/Workbench or add mysqldump to PATH."
    exit 1
}

# If Get-Command found it, get the executable path
if ($mysqldump -is [System.Management.Automation.ApplicationInfo]) {
    $mysqldump = $mysqldump.Source
}

# Run the full database backup
& $mysqldump `
    -h viaduct.proxy.rlwy.net `
    -P 58769 `
    -u root `
    -p `
    --single-transaction `
    --routines `
    --triggers `
    --events `
    --databases G13_hospital_db `
    --result-file="$backupFile"

# Check whether the backup actually succeeded
if ($LASTEXITCODE -eq 0 -and (Test-Path $backupFile)) {

    Write-Host "Backup completed successfully."
    Write-Host "Backup file: $backupFile"

} else {

    Write-Host "ERROR: Database backup failed."
    exit 1
}