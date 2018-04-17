@echo off

setlocal enabledelayedexpansion

set GEK_PATH_CRD=%CD%
set GEK_PATH_BIN=%GEK_PATH_CRD%\bin
set GEK_PATH_TMP=%GEK_PATH_CRD%\temp
set GEK_PATH_DWL=%GEK_PATH_CRD%\downloads
set GEK_PATH_DRV=%GEK_PATH_CRD%\drivers

set GEK_FILE_GEK_ZIP=geckodriver-v0.20.1-win64.zip
set GEK_FILE_GEK_exe=geckodriver.exe

set GEK_URL_GEK=https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win64.zip

set GEK_CMD=%GEK_PATH_BIN%\CMD.bat
set GEK_CMD_BIT=%PATH_BIN%\DL.bat
set GEK_CMD_TGZ=%PATH_BIN%\TGZ.bat
set GEK_CMD_DEL=DEL


set GEK_FUNC_NAM=%1
shift
GOTO %GEK_FUNC_NAM%

rem file check
:CHECK

 IF NOT EXIST "%GEK_PATH_DRV%\%GEK_FILE_GEK_exe%" ( exit /b 1 )

exit /b 0
rem end -----------------------------------------

rem File Downloard
:DL

 rem Selenium Standalone Serverのダウンロード
 CALL "%GEK_CMD_BIT%" %GEK_URL_GEK% "%GEK_PATH_DWL%\%GEK_FILE_GEK_ZIP%"
 
 rem Selenium Standalone Serverの配置
 CALL "%GEK_CMD_TGZ%" UGZ "%GEK_PATH_DWL%\%GEK_FILE_GEK_ZIP%" "%GEK_PATH_DRV%"
 
 CALL "%GEK_CMD%" %GEK_CMD_DEL% "%GEK_PATH_DWL%\%GEK_FILE_GEK_ZIP%"
 
exit /b 0
rem end -----------------------------------------
