#!/bin/bash

# Script to automate running a Python app in a virtual environment

VENV_DIR=".venv"
PYTHON_SCRIPT="app.py"

# Check if virtual environment exists, if not create it
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment. Please check your Python installation."
        exit 1
    fi
    echo "Virtual environment created successfully."
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Check if activation was successful
if [ $? -ne 0 ]; then
    echo "Failed to activate virtual environment."
    exit 1
fi

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
    if [ $? -ne 0 ]; then
        echo "Failed to install dependencies."
        deactivate
        exit 1
    fi
else
    # Install required packages explicitly if no requirements.txt
    echo "Installing required packages..."
    pip install flask
    if [ $? -ne 0 ]; then
        echo "Failed to install flask."
        deactivate
        exit 1
    fi
fi

# Run the Python script
echo "Running $PYTHON_SCRIPT..."
python "$PYTHON_SCRIPT"

# Deactivate the virtual environment when done
deactivate

echo "Execution completed."
