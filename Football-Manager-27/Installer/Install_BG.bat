@echo off
setlocal
title FM27 Bulgarian Translation - johnkill34
set "SCRIPT=%~dp0Install_BG.ps1"
if not exist "%SCRIPT%" (
  echo [ERROR] Install_BG.ps1 is missing. Extract the entire ZIP archive.
  pause
  exit /b 1
)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%"
set "EXITCODE=%ERRORLEVEL%"
echo.
if not "%EXITCODE%"=="0" echo Installation was not completed. Error code: %EXITCODE%
pause
exit /b %EXITCODE%
