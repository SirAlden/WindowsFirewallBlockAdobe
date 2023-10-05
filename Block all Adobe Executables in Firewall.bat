@echo off
goto check_Permissions
:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto yes
    ) else (
        echo Failure: Current permissions inadequate, needs Administrator.
    )
    pause >nul
    exit
:yes
for /R "C:\Program Files\Adobe" %%G in (*.exe) do (
    echo Blocking %%G
    netsh advfirewall firewall add rule name="Adobe Block Out %%~nG" dir=out action=block program="%%G"
	netsh advfirewall firewall add rule name="Adobe Block In %%~nG" dir=in action=block program="%%G"
)
for /R "C:\Program Files\Common Files\Adobe" %%G in (*.exe) do (
    echo Blocking %%G
    netsh advfirewall firewall add rule name="Adobe Block Out %%~nG" dir=out action=block program="%%G"
	netsh advfirewall firewall add rule name="Adobe Block In %%~nG" dir=in action=block program="%%G"
)
for /R "C:\Program Files (x86)\Adobe" %%G in (*.exe) do (
    echo Blocking %%G
    netsh advfirewall firewall add rule name="Adobe Block Out %%~nG" dir=out action=block program="%%G"
	netsh advfirewall firewall add rule name="Adobe Block In %%~nG" dir=in action=block program="%%G"
)
for /R "C:\Program Files (x86)\Common Files\Adobe" %%G in (*.exe) do (
    echo Blocking %%G
    netsh advfirewall firewall add rule name="Adobe Block Out %%~nG" dir=out action=block program="%%G"
	netsh advfirewall firewall add rule name="Adobe Block In %%~nG" dir=in action=block program="%%G"
)

echo All adobe products have been blocked.
pause