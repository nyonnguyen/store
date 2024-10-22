@echo off
REM Change directory to the project folder
cd /d C:\Users\Nyon\code\kdp

REM Check if venv folder exists, if not, install requirements and npm dependencies
if not exist "venv\" (
    echo Virtual environment not found, Create and installing dependencies...
    
    REM Create a virtual environment if needed (ensure Python and virtualenv are installed)
    python -m venv venv

)

REM Activate the virtual environment
call venv\Scripts\activate

REM Install Python dependencies
pip install -r requirements.txt
	
echo
REM Navigate to the frontend folder and run npm install
cd web_app\frontend
if not exist "node_modules\" (
    echo Installing npm dependencies...
    call npm install
) else (
	Echo found node_modules
)

REM Go back to the main directory and run the Python script
cd ../..
python start_web.py

REM Pause the script to see the output (optional)
pause
