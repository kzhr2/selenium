@echo off

setlocal enabledelayedexpansion

set IED_PATH_CRD=%CD%
set IED_PATH_BIN=%IED_PATH_CRD%\bin
set IED_PATH_TMP=%IED_PATH_CRD%\temp
set IED_PATH_DWL=%IED_PATH_CRD%\downloads
set IED_PATH_DRV=%IED_PATH_CRD%\drivers

set IED_FILE_IED_ZIP=IEDriverServer_x64_3.9.0.zip
set IED_FILE_IED_exe=IEDriverServer.exe
set GEK_FILE_GEK_ZIP=geckodriver-v0.20.1-win64.zip
set GEK_FILE_GEK_exe=geckodriver-v0.20.1-win64.exe

set IED_URL_IED=http://selenium-release.storage.googleapis.com/3.9/IEDriverServer_x64_3.9.0.zip
set GEK_URL_GEK=https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-win64.zip

set IED_CMD=%IED_PATH_BIN%\CMD.bat
set IED_CMD_BIT=%PATH_BIN%\DL.bat
set IED_CMD_TGZ=%PATH_BIN%\TGZ.bat
set IED_CMD_DEL=DEL


set IED_FUNC_NAM=%1
shift
GOTO %IED_FUNC_NAM%

rem file check
:CHECK

 IF NOT EXIST "%IED_PATH_DRV%\%IED_FILE_IED_exe%" ( exit /b 1 )

exit /b 0
rem end -----------------------------------------

rem File Downloard
:DL

 rem Selenium Standalone Serverのダウンロード
 CALL "%IED_CMD_BIT%" %IED_URL_IED% "%IED_PATH_DWL%\%IED_FILE_IED_ZIP%"
 
 rem Selenium Standalone Serverの配置
 CALL "%IED_CMD_TGZ%" UGZ "%IED_PATH_DWL%\%IED_FILE_IED_ZIP%" "%IED_PATH_DRV%"
 
 CALL "%IED_CMD%" %IED_CMD_DEL% "%IED_PATH_DWL%\%IED_FILE_IED_ZIP%"
 
exit /b 0
rem end -----------------------------------------
