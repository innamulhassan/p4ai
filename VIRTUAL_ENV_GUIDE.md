# Virtual Environment Setup Guide

This guide helps you set up isolated Python virtual environments for each AI pattern implementation folder.

## Quick Setup

### Option 1: PowerShell (Recommended)
```powershell
.\setup_environments.ps1
```

### Option 2: Batch File
```cmd
setup_environments.bat
```

### Option 3: Manual Setup
Navigate to each folder and run:
```bash
cd 01-llm-plus-tools
python -m venv venv
venv\Scripts\activate     # Windows
# or
source venv/bin/activate  # Linux/Mac
pip install -r requirements.txt
```

## Folder Structure After Setup

```
p4ai/
├── 01-llm-plus-tools/
│   ├── venv/                    # Virtual environment
│   ├── requirements.txt         # LLM + Tools packages
│   └── README.md
├── 02-llm-plus-agents-plus-tools/
│   ├── venv/                    # Virtual environment
│   ├── requirements.txt         # Agents + Tools packages
│   └── README.md
├── 03-llm-plus-mcp/
│   ├── venv/                    # Virtual environment
│   ├── requirements.txt         # MCP packages
│   └── README.md
├── 04-llm-plus-agent-plus-mcp/
│   ├── venv/                    # Virtual environment
│   ├── requirements.txt         # Agents + MCP packages
│   └── README.md
├── 06-agent-training/
│   ├── venv/                    # Virtual environment
│   ├── requirements.txt         # Training packages
│   └── README.md
├── setup_environments.ps1       # PowerShell setup script
├── setup_environments.bat       # Batch setup script
└── VIRTUAL_ENV_GUIDE.md        # This file
```

## Package Overview

### 01-llm-plus-tools
- **OpenAI, Anthropic**: LLM APIs
- **LangChain**: LLM framework
- **Requests, HTTPX**: HTTP clients
- **Pydantic**: Data validation
- **Jupyter**: Interactive development

### 02-llm-plus-agents-plus-tools
- **All from pattern 1, plus:**
- **LangGraph**: Agent workflows
- **AutoGen, CrewAI**: Multi-agent frameworks
- **Celery, Redis**: Task queues
- **AsyncIO**: Asynchronous programming

### 03-llm-plus-mcp
- **All core LLM packages, plus:**
- **MCP**: Model Context Protocol
- **WebSockets, AIOHTTP**: Network protocols
- **FastAPI, Uvicorn**: Web framework
- **JSONSchema**: Validation

### 04-llm-plus-agent-plus-mcp
- **Combines all packages from patterns 2 and 3**
- **Full-featured distributed agent system**

### 06-agent-training
- **PyTorch, Transformers**: Deep learning
- **PEFT, TRL**: Fine-tuning libraries
- **Weights & Biases**: Experiment tracking
- **Stable Baselines3**: Reinforcement learning
- **Ray RLLib**: Distributed RL

## Daily Usage

### Activate Environment
```bash
# Navigate to your pattern folder
cd 01-llm-plus-tools

# Activate environment
venv\Scripts\activate     # Windows
source venv/bin/activate  # Linux/Mac
```

### Deactivate Environment
```bash
deactivate
```

### Install Additional Packages
```bash
# After activating environment
pip install package-name

# Save to requirements
pip freeze > requirements.txt
```

### Update All Packages
```bash
pip install --upgrade -r requirements.txt
```

## IDE Integration

### VS Code
1. Open folder in VS Code
2. Press `Ctrl+Shift+P`
3. Type "Python: Select Interpreter"
4. Choose the interpreter from `venv/Scripts/python.exe`

### PyCharm
1. File → Settings → Project → Python Interpreter
2. Add Interpreter → Existing Environment
3. Select `venv/Scripts/python.exe`

## Troubleshooting

### PowerShell Execution Policy
If you get an execution policy error:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Python Not Found
1. Install Python from [python.org](https://python.org)
2. Ensure Python is added to PATH
3. Restart terminal

### Package Installation Failures
```bash
# Upgrade pip first
python -m pip install --upgrade pip

# Install with verbose output
pip install -v package-name

# Use different index if needed
pip install -i https://pypi.org/simple/ package-name
```

### Virtual Environment Issues
```bash
# Remove corrupted environment
rm -rf venv  # Linux/Mac
rmdir /s venv  # Windows

# Recreate environment
python -m venv venv
```

## Best Practices

1. **Always activate** the environment before working
2. **Keep requirements.txt updated** when adding packages
3. **Use separate environments** for each pattern to avoid conflicts
4. **Commit requirements.txt** but not the venv folder
5. **Document custom packages** in your project README

## Framework Alternatives

### Poetry (Alternative Package Manager)
```bash
# Install Poetry
pip install poetry

# Initialize project
poetry init

# Add dependencies
poetry add openai langchain

# Activate environment
poetry shell
```

### Conda (Alternative Environment Manager)
```bash
# Create environment
conda create -n llm-tools python=3.11

# Activate environment
conda activate llm-tools

# Install packages
conda install openai langchain -c conda-forge
```

### Pipenv (Alternative Virtual Environment)
```bash
# Install Pipenv
pip install pipenv

# Create environment and install packages
pipenv install

# Activate environment
pipenv shell
```