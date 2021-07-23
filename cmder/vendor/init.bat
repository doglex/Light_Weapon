@echo off
set CMDER_INIT_START=%time%
set GIT_INSTALL_ROOT=C:\Program Files\Git
if not defined time_init set time_init=0
if not defined max_depth set max_depth=1
if not defined nix_tools set nix_tools=1

set "CMDER_USER_FLAGS= "
if not defined CMDER_ROOT (
    if defined ConEmuDir (
        for /f "delims=" %%i in ("%ConEmuDir%\..\..") do (
            set "CMDER_ROOT=%%~fi"
        )
    ) else (
        for /f "delims=" %%i in ("%~dp0\..") do (
            set "CMDER_ROOT=%%~fi"
        )
    )
)

if "%CMDER_ROOT:~-1%" == "\" SET "CMDER_ROOT=%CMDER_ROOT:~0,-1%"
call "%cmder_root%\vendor\bin\cexec.cmd" /setpath
call "%cmder_root%\vendor\lib\lib_console"
call "%cmder_root%\vendor\lib\lib_git"
call "%cmder_root%\vendor\lib\lib_profile"
call "%cmder_root%\config\user_aliases.cmd"
set "CMDER_SHELL=cmd"
set CMDER_CLINK=1
set CMDER_ALIASES=1
set clink_architecture=x64
set architecture_bits=64
"%CMDER_ROOT%\vendor\clink\clink_%clink_architecture%.exe" inject --quiet --profile "%CMDER_ROOT%\config" --scripts "%CMDER_ROOT%\vendor"
set PLINK_PROTOCOL=ssh
if not defined TERM set TERM=cygwin
set "PATH=%GIT_INSTALL_ROOT%\cmd;%PATH%;%GIT_INSTALL_ROOT%\mingw32\bin;%GIT_INSTALL_ROOT%\mingw64\bin;%GIT_INSTALL_ROOT%\usr\bin;%CMDER_ROOT%\vendor\bin;%CMDER_ROOT%\bin"
if not defined SVN_SSH set "SVN_SSH=%GIT_INSTALL_ROOT:\=\\%\\bin\\ssh.exe"
set git_locale="%GIT_INSTALL_ROOT%\usr\bin\locale.exe"
set LANG=zh_CN.UTF-8
set CMDER_CONFIGURED=1

set CMDER_INIT_END=%time%
if %time_init% gtr 0 (
  "%cmder_root%\vendor\bin\timer.cmd" "%CMDER_INIT_START%" "%CMDER_INIT_END%"
)
exit /b
