@echo off

setlocal enabledelayedexpansion

set PATH_CRD=%CD%
set PATH_BIN=%PATH_CRD%\bin

set CMD_TGZ=%PATH_BIN%\TGZ.bat
set CMD_JAV=%PATH_BIN%\JAVA.bat
set CMD_SSS=%PATH_BIN%\SSS.bat
set CMD_IED=%PATH_BIN%\IED.bat
set CMD_GKD=%PATH_BIN%\GKD.bat

::ZIP rem -----------------------------------------
CALL :INS_FUNC "%CMD_TGZ%"

::JDK rem -----------------------------------------
CALL :INS_FUNC "%CMD_JAV%"

::SSS rem -----------------------------------------
CALL :INS_FUNC "%CMD_SSS%"

::IED rem -----------------------------------------
CALL :INS_FUNC "%CMD_IED%"

::GKD rem -----------------------------------------
rem CALL :INS_FUNC "%CMD_GKD%"


echo ALL SUCCESS


GOTO :END

 rem -----------------------------------------
:INS_FUNC
CALL "%~1" CHECK

if %ERRORLEVEL% equ 1 (
  CALL "%~1" DL
) else (
  echo %~n1 OK
)

 rem -----------------------------------------
:END

endlocal

exit /b 0

