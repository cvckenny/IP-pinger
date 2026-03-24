@echo off
title Multi IP Tool - Live Mode
color 7

:: ===========================
:: MAIN MENU
:: ===========================
:menu
cls
echo ======================================
echo   YOUTUBEVIDEO   MULTI IP TOOL 
echo ======================================
echo.
echo 1. IP Lookup
echo 2. IP Pinger 
echo 4. Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto ip_lookup
if "%choice%"=="2" goto ip_pinger
if "%choice%"=="3" goto tcp_checker
if "%choice%"=="4" exit

goto menu

:: ===========================
:: IP LOOKUP
:: ===========================
:ip_lookup
cls
echo ===========================
echo        IP LOOKUP
echo ===========================
echo.

set /p ip=Enter IP to lookup: 

echo.
powershell -command "try { Invoke-RestMethod ipinfo.io/%ip% } catch { 'Lookup failed' }"

pause
goto menu

:: ===========================
:: IP PINGER 
:: ===========================
:ip_pinger
cls
echo ===========================
echo         IP PINGER
echo ===========================
echo.
echo Enter IPs separated by spaces
echo Example: 8.8.8.8 1.1.1.1
echo.

set /p ips=IPs: 

echo.
echo Pinging IPs (Press CTRL+C to stop)
echo.

for %%i in (%ips%) do (
    echo --------------------------
    echo Pinging %%i
    ping %%i -n 20
)

echo.
echo Done.
pause
goto menu

:: ===========================
:: TCP PORT CHECKER (10 TIMES)
:: ===========================
