@echo off
echo Setting up virtual environments for AI patterns...

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python not found. Please install Python first.
    pause
    exit /b 1
)

echo Found Python installation

REM Create virtual environments for each folder
for %%f in (01-llm-plus-tools 02-llm-plus-agents-plus-tools 03-llm-plus-mcp 04-llm-plus-agent-plus-mcp 06-agent-training) do (
    if exist "%%f" (
        echo.
        echo Setting up environment for %%f...
        cd "%%f"
        
        REM Create virtual environment
        python -m venv venv
        
        REM Activate virtual environment and install packages
        call venv\Scripts\activate.bat
        
        REM Upgrade pip
        python -m pip install --upgrade pip
        
        REM Install packages from requirements.txt if it exists
        if exist "requirements.txt" (
            echo Installing packages from requirements.txt...
            pip install -r requirements.txt
        ) else (
            echo No requirements.txt found in %%f
        )
        
        REM Deactivate virtual environment
        call deactivate
        
        REM Go back to root directory
        cd ..
        
        echo Environment setup complete for %%f
    ) else (
        echo Folder %%f not found, skipping...
    )
)

echo.
echo All environments setup complete!
echo To activate an environment, navigate to the folder and run:
echo Windows: venv\Scripts\activate.bat
pause