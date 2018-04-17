@echo off

setlocal enabledelayedexpansion

set TGZ_PATH_CRD=%CD%
set TGZ_PATH_BIN=%TGZ_PATH_CRD%\bin
set TGZ_PATH_TMP=%TGZ_PATH_CRD%\temp
set TGZ_PATH_DWL=%PATH_CRD%\downloads
set TGZ_PATH_ZIP=C:\Program Files\7-Zip

set TGZ_FILE_ZIP_EXE=7z1801-x64.exe

set TGZ_URL_ZIP=https://www.7-zip.org/a/7z1801-x64.exe

set TGZ_CMD=%TGZ_PATH_BIN%\CMD.bat
set TGZ_CMD_BIT=%PATH_BIN%\DL.bat
set TGZ_CMD_ZIP=%TGZ_PATH_ZIP%\7z.exe
set TGZ_CMD_MOV=MOVE
set TGZ_CMD_DEL=DEL

set TGZ_FUNC_NAM=%1
shift
GOTO %TGZ_FUNC_NAM%

rem file check
:CHECK

 IF NOT EXIST "%TGZ_CMD_ZIP%" ( exit /b 1 )

exit /b 0
rem end -----------------------------------------

rem File Downloard
:DL

 rem ZIPコマンドのダウンロード
 CALL "%TGZ_CMD_BIT%" %TGZ_URL_ZIP% "%TGZ_PATH_DWL%\%TGZ_FILE_ZIP_EXE%"
 
 rem 一時領域へ移動
 CALL "%TGZ_CMD%" %TGZ_CMD_MOV% "%TGZ_PATH_DWL%\%TGZ_FILE_ZIP_EXE%" "%TGZ_PATH_TMP%"
 
 rem ZIPコマンドのインストール
 CALL "%TGZ_CMD%" "%TGZ_PATH_TMP%\%TGZ_FILE_ZIP_EXE%"

 CALL "%TGZ_CMD%" %TGZ_CMD_DEL% "%TGZ_PATH_TMP%\%TGZ_FILE_ZIP_EXE%"

exit /b 0
rem end -----------------------------------------

rem UnTarGz
:UTG

 rem JDKの解凍(gz)
 set OPT_ZIP=x -y -o"%TGZ_PATH_TMP%"
 CALL "%TGZ_CMD%" "%TGZ_CMD_ZIP%" %OPT_ZIP% "%~1"

 rem JDKの解凍(tar)＆配置
 set OPT_ZIP=x -y -o"%~2"
 CALL "%TGZ_CMD%" "%TGZ_CMD_ZIP%" %OPT_ZIP% "%TGZ_PATH_TMP%\%~n1"

 CALL "%TGZ_CMD%" %TGZ_CMD_DEL% "%TGZ_PATH_TMP%\%~n1"

exit /b 0
rem end -----------------------------------------

:UGZ

 rem JDKの解凍(gz)
 set OPT_ZIP=x -y -o"%~2%"
 CALL "%TGZ_CMD%" "%TGZ_CMD_ZIP%" %OPT_ZIP% "%~1"

exit /b 0
rem end -----------------------------------------

endlocal
