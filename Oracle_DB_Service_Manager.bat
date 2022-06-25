@echo off

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

 if '%errorlevel%' NEQ '0' (
     echo Requesting administrative privileges...
     goto UACReload
 ) else ( goto GOT_UAC )

:UACReload
     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
     echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
     exit /B

:GOT_UAC
     if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
     pushd "%CD%"
     CD /D "%~dp0"

echo ------------------------------
echo Oracle Database Service Manager
echo ------------------------------
echo.
echo 1. Start Oracle DB Service
echo 2. Stop Oracle DB Service
echo 3. Restart Oracle DB Service
echo 4. Exit
echo.
set /p Input=Input Service Number: 

if %Input% == 1 (
	net start OracleServiceXE
	net start OracleVssWriterXE
	net start OracleOraDB21Home1TNSListener
	net start OracleOraDB21Home1MTSRecoveryService
	echo Oracle DB service started successfully.
	pause
)

if %Input% == 2 (
	net stop OracleServiceXE
	net stop OracleVssWriterXE
	net stop OracleOraDB21Home1TNSListener
	net stop OracleOraDB21Home1MTSRecoveryService
	echo Oracle DB services are successfully stopped.
	pause
)

if %Input% == 3 (
	net stop OracleServiceXE
	net stop OracleVssWriterXE
	net stop OracleOraDB21Home1TNSListener
	net stop OracleOraDB21Home1MTSRecoveryService
	net start OracleServiceXE
	net start OracleVssWriterXE
	net start OracleOraDB21Home1TNSListener
	net start OracleOraDB21Home1MTSRecoveryService
	echo Oracle DB service restarted successfully.
	pause
)

if %Input% == 4 (
	exit
)