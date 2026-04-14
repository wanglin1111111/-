@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

title 快速搜索

:: 检查参数
if "%~1"=="" (
    echo 用法: quick_search.bat "你的搜索问题"
    echo.
    echo 示例:
    echo   quick_search.bat "武汉有哪些有名旅游景点"
    echo   quick_search.bat "python list comprehension"
    pause
    exit /b 1
)

:: 检查服务
curl -s http://127.0.0.1:18765/health >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 搜索服务未运行，正在启动...
    start "" /min "%~dp0start_server.bat"
    timeout /t 15 >nul
)

:: 执行搜索
echo.
echo 搜索: %~1
echo ========================================
curl -s -X POST http://127.0.0.1:18765/search ^
  -H "Content-Type: application/json" ^
  -d "{\"query\": \"%~1\", \"max_results\": 5}"
echo.
echo ========================================
