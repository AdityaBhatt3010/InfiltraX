# ---------------------------------------------
# PowerShell Script to Build and Run Docker Container for Ethical Intrusions
# Author: Aditya Bhatt
# ---------------------------------------------

# PowerShell Script to Build and Run Docker Container for Ethical Intrusions

Write-Host "`nStarting Docker Build Process..."

# Step 1: Build Docker Image
docker build -t ethical-intrusions .

if ($LASTEXITCODE -ne 0) {
    Write-Host "`nDocker Build Failed"
    exit 1
}

Write-Host "`nDocker Image Built Successfully"

# Step 2: Create Output Directory if not exists
if (-Not (Test-Path -Path "./output")) {
    New-Item -ItemType Directory -Path "./output" | Out-Null
    Write-Host "Created local 'output' directory for container bind mount"
}

# Step 3: Run Docker Container
Write-Host "`nRunning Docker Container..."

docker run -it --rm `
  --name vapt-lab `
  --network host `
  --cap-add=NET_ADMIN `
  -v ${PWD}/output:/opt/ethical-intrusions/output `
  ethical-intrusions

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nContainer exited cleanly"
} else {
    Write-Host "`nContainer exited with errors"
}
