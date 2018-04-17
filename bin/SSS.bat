@echo off

setlocal enabledelayedexpansion

set SSS_PATH_CRD=%CD%
set SSS_PATH_BIN=%SSS_PATH_CRD%\bin
set SSS_PATH_TMP=%SSS_PATH_CRD%\temp
set SSS_PATH_DWL=%PATH_CRD%\downloads
set SSS_PATH_LIB=%PATH_CRD%\lib

set SSS_FILE_SSS_JAR=selenium-server-standalone-3.9.1.jar

set SSS_URL_SSS=http://selenium-release.storage.googleapis.com/3.9/selenium-server-standalone-3.9.1.jar

set SSS_CMD=%SSS_PATH_BIN%\CMD.bat
set SSS_CMD_BIT=%PATH_BIN%\DL.bat
set CMD_MOV=MOVE


set SSS_FUNC_NAM=%1
shift
GOTO %SSS_FUNC_NAM%

rem file check
:CHECK

 IF NOT EXIST "%SSS_PATH_LIB%\%SSS_FILE_SSS_JAR%" ( exit /b 1 )

exit /b 0
rem end -----------------------------------------

rem File Downloard
:DL

 rem Selenium Standalone Serverのダウンロード
 CALL "%SSS_CMD_BIT%" %SSS_URL_SSS% "%SSS_PATH_DWL%\%SSS_FILE_SSS_JAR%"
 
 rem Selenium Standalone Serverの配置
 CALL "%SSS_CMD%" %CMD_MOV% "%SSS_PATH_DWL%\%SSS_FILE_SSS_JAR%" "%SSS_PATH_LIB%"
 
exit /b 0
rem end -----------------------------------------
