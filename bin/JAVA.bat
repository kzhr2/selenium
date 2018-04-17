@echo off

setlocal enabledelayedexpansion

set JAVA_PATH_CRD=%CD%
set JAVA_PATH_BIN=%JAVA_PATH_CRD%\bin
set JAVA_PATH_TMP=%JAVA_PATH_CRD%\temp
set JAVA_PATH_DWL=%PATH_CRD%\downloads
set JAVA_PATH_JAV=%PATH_CRD%\java

set JAVA_FILE_JDK_TGZ=openjdk-10_windows-x64_bin.tar.gz
set JAVA_FILE_JDK_TAR=openjdk-10_windows-x64_bin.tar

set JAVA_URL_JDK=https://download.java.net/java/GA/jdk10/10/binaries/openjdk-10_windows-x64_bin.tar.gz

set JAVA_CMD=%JAVA_PATH_BIN%\CMD.bat
set JAVA_CMD_BIT=%PATH_BIN%\DL.bat
set JAVA_CMD_TGZ=%PATH_BIN%\TGZ.bat
set JAVA_CMD_JAV=%JAVA_PATH_JAV%\jdk-10\bin\java.exe
set JAVA_CMD_DEL=DEL


set JAVA_FUNC_NAM=%1
shift
GOTO %JAVA_FUNC_NAM%

rem file check
:CHECK

 IF NOT EXIST "%JAVA_CMD_JAV%" ( exit /b 1 )

exit /b 0
rem end -----------------------------------------

rem File Downloard
:DL

 rem ZIPコマンドのダウンロード
 CALL "%JAVA_CMD_BIT%" %JAVA_URL_JDK% "%JAVA_PATH_DWL%\%JAVA_FILE_JDK_TGZ%"
 
 rem JDKの解凍＆配置
 CALL %JAVA_CMD_TGZ% UTG "%JAVA_PATH_DWL%\%JAVA_FILE_JDK_TGZ%" "%JAVA_PATH_JAV%"
 
 rem ダウンロードファイルの削除
 CALL "%JAVA_CMD%" %JAVA_CMD_DEL% "%JAVA_PATH_DWL%\%JAVA_FILE_JDK_TGZ%"

exit /b 0
rem end -----------------------------------------
