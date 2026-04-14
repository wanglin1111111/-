@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1

set PYTHON_EXE=C:\Program Files\AutoClaw\resources\python\python.exe
set SKILL_DIR=%USERPROFILE%\.openclaw\skills\low-cost-search
set SERVER_PATH=%SKILL_DIR%\scripts\search_server.py

if not exist "%PYTHON_EXE%" (
    echo [ERROR] Python not found: %PYTHON_EXE%
    timeout /t 5 >nul
    exit /b 1
)

if not exist "%SERVER_PATH%" (
    echo [ERROR] Skill not found
    timeout /t 5 >nul
    exit /b 1
)

:: Kill existing server on port 18765
for /f "tokens=5" %%a in ('netstat -ano 2^>nul ^| findstr ":18765.*LISTENING"') do (
    taskkill /F /PID %%a >nul 2>&1
    timeout /t 2 >nul
)

:: Start server directly (no pause, no title, auto-start)
"%PYTHON_EXE%" "%SERVER_PATH%" --warmup --port 18765
