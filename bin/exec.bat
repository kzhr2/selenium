
set CMD=.\bin\CMD.bat
set CMD_JAVA=.\java\jdk-10\bin\java

set OPT_DRV_IE=.\drivers\IEDriverServer.exe
set OPT_DRV_GK=.\drivers\geckodriver.exe
set OPT_WEB_FF=C:\Program Files\Mozilla Firefox\firefox.exe

set OPT_JAR=.\lib\selenium-server-standalone-3.9.1.jar
set OPT_CNF=.\configs\NodeConfig.json

cd %~p0\..\
start "%CMD%" "%CMD_JAVA%" -Dwebdriver.ie.driver="%OPT_DRV_IE%" -Dwebdriver.gecko.driver="%OPT_DRV_GK%" -Dwebdriver.firefox.bin="%OPT_WEB_FF%" -jar "%OPT_JAR%" -role node -nodeConfig "%OPT_CNF%"
