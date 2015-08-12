@echo off

REM =================================
if [%1]==[] %~dp0\..\getadmin.bat "%~dp0\%~nx0"

REM =================================
set path=%path%;C:\Program Files (x86)\Git\cmd
set DOC=d:\Users\%USERNAME%\Documents
set TASKS=%DOC%\tasks
set PASS=1

REM =================================

powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

REM =================================

choco feature enable -nautoUninstaller

cinst -y 7zip classic-shell cmder cpu-z crystaldiskinfo crystaldiskmark dropbox everything f.lux filebot firefox foxitreader git github google-chrome-x64 gow hg kodi line listary mp3tag netscan64 nimbletext notepadplusplus paint.net potplayer putty python2 skype teamviewer teraterm visualstudioexpress2008 windowsliveinstaller winmerge winscp wireshark

REM =================================

mkdir %DOC%
cd/d %DOC%
git clone https://github.com/chsliu/batch.git tasks

SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC ONSTART /TN "startup-%USERNAME%" /TR "%TASKS%\startup.bat"
SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC DAILY /TN "daily-%USERNAME%" /TR "%TASKS%\daily.bat" /ST 16:30
SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC WEEKLY /D FRI /TN "weekly-%USERNAME%" /TR "%TASKS%\weekly.bat" /ST 17:00
SchTasks /Create /F /RL HIGHEST /RU %USERNAME% /RP %PASS% /SC MONTHLY /MO LAST /D FRI /TN "monthly-%USERNAME%" /TR "%TASKS%\monthly.bat" /ST 17:30

REM =================================

cd/d batch
git clone https://github.com/chsliu/ShooterSubPyDownloader.git

REM =================================

mkdir %appdata%\Kodi
cd/d %appdata%\Kodi
git clone https://github.com/chsliu/userdata.git

REM =================================

rem pause

C:\Windows\System32\timeout.exe 10
