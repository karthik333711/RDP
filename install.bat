@echo off
if not exist "%~dp0RDPWInst.exe" goto :error
"%~dp0RDPWInst" -i -o
echo ______________________________________________________________
echo.
echo You can check RDP functionality with RDPCheck program.
echo Also you can configure advanced settings with RDPConf program.
echo.
goto :anykey
:error
echo [-] Installer executable not found.
echo Please extract all files from the downloaded package or check your anti-virus.
:anykey

@echo off
powershell -ExecutionPolicy Bypass -Command "Stop-Service termservice -Force"
powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini -OutFile 'C:\Program Files\RDP Wrapper\rdpwrap.ini'"
powershell -ExecutionPolicy Bypass -Command "Start-Service termservice"

net start /Y TermService
net start /Y TermService




