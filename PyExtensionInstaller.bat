
@echo off
color 0E
title Python3 Extensions Installer
echo.

GOTO greetings

rem=================Check Internet Connectivity====================
:connStatus
Ping www.google.nl -n 1 -w 1000
cls
if errorlevel 1 (set internet=Hey %USERNAME% it seems like you are not connected to internet. Please ensure that you are connected to the internet.) else GOTO mainMenu
echo Internet Connection Error
echo.
echo %internet%
pause>nul
exit



rem =======================Menu Function=========================
:mainMenu
cls
echo.
echo ===================MAIN MENU===========================
echo Install Python 3.7     [PRESS 1]
echo Install Pip 10         [PRESS 2]
echo Install Python Modules [PRESS 3] 
echo Check Installed Modules[PRESS 4]
echo Pip Uninstall          [PRESS 5]
echo Exit                   [PRESS 0]
echo =======================================================

echo.
set /P id=Please enter number: 
IF '%id%' == '1' GOTO 1
IF '%id%' == '2' GOTO 2
IF '%id%' == '3' GOTO 3
IF '%id%' == '4' GOTO 4
IF '%id%' == '5' GOTO 5
IF '%id%' == '0' GOTO 0

GOTO mainMenu

rem =================Python Installation Function=================
:1
cls
echo Installing Python 3.7
echo......................
echo.
echo Please wait while Python3.7 installs...
start "" /w /b "python-3.7.0b3-amd64.exe"
pause >nul
cls
echo.
GOTO mainMenu
exit


rem ======================Pip Installation========================
:2
cls
echo Installing Pip 10
echo ..................
echo.
start "" /w /b "get-pip.py"
pause >nul
cls
echo.
GOTO mainMenu
exit

rem ====================Modules Installation======================
:3
cls
echo Modules Installation
echo ....................	
echo.

::echo Enter a filename to start install using pip
::set  INPUT=
::set  /P INPUT=Type input:%=%
::pip install %INPUT%

pip install  numpy-1.14.2+mkl-cp37-cp37m-win_amd64.whl python_dateutil-2.7.3-py2.py3-none-any.whl pytz-2018.4-py2.py3-none-any.whl setuptools-39.2.0-py2.py3-none-any.whl pandas-0.23.0-cp37-cp37m-win_amd64.whl cycler-0.10.0-py2.py3-none-any.whl kiwisolver-1.0.1-cp37-cp37m-win_amd64.whl pyparsing-2.2.0-py2.py3-none-any.whl matplotlib-2.2.2-cp37-cp37m-win_amd64.whl
pause>nul 
cls
echo.
GOTO mainMenu
exit

rem
:4
cls
echo Installed Modules
echo .................
pip freeze
pause >nul
cls
echo.
GOTO mainMenu
exit

rem ====================Pip Uninstall=================
:5
cls
echo Uninstall Python
echo ................
echo.
echo Enter a filename to UNINSTALL using pip
set  INPUT=
set /P INPUT=Type input:%=%
cd  \
cd  \python%python_ver%\Scripts\
echo Are you sure you want to uninstall "%INPUT%" ? Y/N
set /P opt=:
IF '%opt%' == 'N' GOTO mainMenu
IF '%opt%' == 'n' GOTO mainMenu
   pip uninstall %INPUT%
exit
 
pause
exit

rem =======================Exit Function==========================
:0
cls
echo Are you sure you want to exit? Y/N
set /P opt=:
IF '%opt%' == 'N' GOTO mainMenu
IF '%opt%' == 'n' GOTO mainMenu
exit



::=========================================Greetings Function====================================
:greetings
echo                           * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **
echo                           * Hi %USERNAME%                                                   *
echo                           * Welcome to Python Extensions Installer, a quick and easy   * 
echo                           * way to install Python 3.7 and its modules (extensions)  *                   
echo                           *                                                            *
echo                           * Created by:         Devon Wintz                            *
echo                           * Date last modified: May 10, 2018                           *
echo                           *                                                            *
echo                           * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * **
echo.
echo Please press 'ENTER' to continue
pause >nul	
echo.
GOTO connStatus
exit

