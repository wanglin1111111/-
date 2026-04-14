@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1

title Search Test
echo ========================================
echo   Low-Cost Search Test
echo ========================================
echo.
curl -s http://127.0.0.1:18765/health >nul 2>&1
if %errorlevel% neq 0 (
echo [ERROR] Server not running!
echo Please run start_server.bat first
pause
exit /b 1
)
echo [OK] Server is running
echo.
echo Test 1: Knowledge base hit
echo ========================================
curl -s -X POST http://127.0.0.1:18765/search -H "Content-Type: application/json" -d "{\"query\": \"test query\", \"max_results\": 3}"
echo.
echo.
echo Test complete!
pause
