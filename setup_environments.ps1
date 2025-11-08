# PowerShell script to create virtual environments for each AI pattern folder
# Run this script from the root directory of the project

Write-Host "Setting up virtual environments for AI patterns..." -ForegroundColor Green

# Array of folder names
$folders = @(
    "01-llm-plus-tools",
    "02-llm-plus-agents-plus-tools", 
    "03-llm-plus-mcp",
    "04-llm-plus-agent-plus-mcp",
    "06-agent-training"
)

# Check if Python is installed
try {
    $pythonVersion = python --version
    Write-Host "Found Python: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "Python not found. Please install Python first." -ForegroundColor Red
    exit 1
}

# Create virtual environments for each folder
foreach ($folder in $folders) {
    if (Test-Path $folder) {
        Write-Host "`nSetting up environment for $folder..." -ForegroundColor Yellow
        
        # Navigate to folder
        Set-Location $folder
        
        # Create virtual environment
        python -m venv venv
        
        # Activate virtual environment and install packages
        if ($IsWindows -or $env:OS -eq "Windows_NT") {
            .\venv\Scripts\Activate.ps1
        } else {
            # For Linux/Mac (if running PowerShell Core)
            & ./venv/bin/Activate.ps1
        }
        
        # Upgrade pip
        python -m pip install --upgrade pip
        
        # Install packages from requirements.txt if it exists
        if (Test-Path "requirements.txt") {
            Write-Host "Installing packages from requirements.txt..." -ForegroundColor Cyan
            pip install -r requirements.txt
        } else {
            Write-Host "No requirements.txt found in $folder" -ForegroundColor Orange
        }
        
        # Deactivate virtual environment
        deactivate
        
        # Go back to root directory
        Set-Location ..
        
        Write-Host "Environment setup complete for $folder" -ForegroundColor Green
    } else {
        Write-Host "Folder $folder not found, skipping..." -ForegroundColor Red
    }
}

Write-Host "`nAll environments setup complete!" -ForegroundColor Green
Write-Host "To activate an environment, navigate to the folder and run:" -ForegroundColor Cyan
Write-Host "Windows: .\venv\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "Linux/Mac: source venv/bin/activate" -ForegroundColor White