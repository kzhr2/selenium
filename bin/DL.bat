@echo off

setlocal enabledelayedexpansion

set DL_PATH_CRD=%CD%
set DL_PATH_BIN=%DL_PATH_CRD%\bin

set DL_CMD=%DL_PATH_BIN%\CMD.bat
set DL_CMD_BIT=bitsadmin.exe

echo "DOWNLOAD NOW"

set DL_OPT_BIT=/TRANSFER htmlget
"%DL_CMD%" "%DL_CMD_BIT%" %DL_OPT_BIT% "%~1" "%~2"
set OPT_BIT=

if %ERRORLEVEL% equ 1 (
  exit /b 1
) else (
  exit /b 0
)

endlocal
