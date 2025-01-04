@echo off
title BATBoot
chcp 65001
mode 50,20
cls
echo BATBoot
echo.
set /p "bootmenu=(B)oot menu or (A)utoboot? "
if %bootmenu% EQU B goto bootmenu
if %bootmenu% EQU A goto autoboot
echo Invalid choice.
pause >nul
exit
:autoboot
if exist C\boot.bat goto bootc
if exist A\boot.bat goto boota
if exist B\boot.bat goto bootb
echo Boot device not found.
pause >nul
exit
:bootc
cls
echo BATBoot
echo.
echo Booting from C...
cd C
start boot.bat
exit
:boota
cls
echo BATBoot
echo.
echo Booting from A...
cd A
start boot.bat
exit
:bootb
cls
echo BATBoot
echo.
echo Booting from B...
cd B
start boot.bat
exit
:bootmenu
cls
echo BATBoot
echo.
set /p "bootmenutype=Boot from (D)rive or (B)ootfile? "
if %bootmenutype% EQU D goto bootmenudrive
if %bootmenutype% EQU B goto bootmenufile
cls
echo BATBoot
echo.
echo Invalid choice.
pause >nul
exit
:bootmenudrive
cls
echo BATBoot
echo.
set /p "bootdevice=Enter boot device: "
if exist %bootdevice%\boot.bat goto bootcustomdrive
cls
echo BATBoot
echo.
echo Invalid drive.
pause >nul
exit
:bootcustomdrive
cls
echo BATBoot
echo.
echo Booting from %bootdevice%...
cd %bootdevice%
start boot.bat
exit
:bootmenufile
cls
echo BATBoot
echo.
set /p "bootfile=Enter boot file: "
if exist %bootfile% goto bootcustomfile
cls
echo BATBoot
echo.
echo Invalid file.
pause >nul
exit
:bootcustomfile
cls
echo BATBoot
echo.
echo Booting %bootfile%...
mkdir %bootfile%.boot
copy %bootfile% %bootfile%.boot\boot.zip
cd %bootfile%.boot
tar -xf boot.zip
del boot.zip
start boot.bat
exit