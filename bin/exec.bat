
set CMD_JAVA=.\java\jdk-10\bin\java

cd %~p0\..\
CALL "%CMD_JAVA%" -Dwebdriver.ie.driver=".\drivers\IEDriverServer.exe" -Dwebdriver.gecko.driver=".\drivers\geckodriver.exe" -Dwebdriver.firefox.bin="C:\Program Files\Mozilla Firefox\firefox.exe" -jar ".\lib\selenium-server-standalone-3.9.1.jar" -role node -nodeConfig ".\configs\NodeConfig.json"
