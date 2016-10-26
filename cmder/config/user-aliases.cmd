;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat %CMDER_ROOT%\config\.history
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars --color $*
pwd=cd
clear=cls
s=pushd %TASKS_ROOT%\batch\ssh  
k=pushd C:\Users\%USERNAME%\AppData\Roaming\Kodi  
va=pushd D:\Users\%USERNAME%\vagrant 
u=pushd %TASKS_ROOT%\utility
d=pushd d:\Users\%USERNAME%\Desktop
csave=robocopy C:\tools\cmder %TASKS_ROOT%\cmder *.bat *.cmd *.sh *.xml /S /R:0 /NDL /NJH /NJS /MT & %TASKS_ROOT%\utility\gitsync.bat
cload=%TASKS_ROOT%\utility\gitsync.bat & robocopy %TASKS_ROOT%\cmder C:\tools\cmder *.bat *.cmd *.sh *.xml /S /R:0 /NDL /NJH /NJS /MT & alias /reload
cfg="C:\Program Files (x86)\Notepad++\notepad++.exe" C:\tools\cmder\config\user-aliases.cmd
re=alias /reload
al=alias
gs=git status
gp=%TASKS_ROOT%\utility\gitsync.bat
pd=popd
su="%TASKS_ROOT%\utility\getadmin.bat" "%TASKS_ROOT%\utility\cmdk.bat"
sudo="%TASKS_ROOT%\utility\getadmin.bat" $*
pathadd="%TASKS_ROOT%\util\setenv.cmd" +PATH "%CD%"

