@echo off

set "fromdir=%1"
if "%fromdir%"=="" set "fromdir=%~dp0"

for /f %%i in ('cmd.exe /c dir /s /b /a:-d "%fromdir%\*.pyc"') do if "%%~xi"==".pyc" (echo *** %%i&&cmd /c del %%i) else (echo SOMETHING WRONG: Try to remove '%%i'&&exit)
for /f %%i in ('cmd.exe /c dir /s /b /a:d "%fromdir%\__pycache__"') do if "%%~ni"=="__pycache__" (echo *** %%i&&cmd /c rmdir %%i) else (echo SOMETHING WRONG: Try to remove '%%i'&&exit)

set "tmp_dir=%fromdir%\.pytest_cache"
if exist "%tmp_dir%" echo *** %tmp_dir%\*.*&&cmd /c rmdir /s /q %tmp_dir%

echo THE END
