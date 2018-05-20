@echo off
title Release Windows

set pathQt=C:\Qt
set pathRepos=C:\Users\Marie_MSI\Documents\Qt\RPM
set releaseName=build-Engine-Desktop_Qt_5_10_0_MinGW_32bit-Release
set releaseGameName=build-Game-Desktop_Qt_5_10_0_MinGW_32bit-Release
set pathRelase=%pathRepos%\%releaseName%
set pathRelaseGame=%pathRepos%\%releaseGameName%
set version=%1
set folderName=RPG-Paper-Maker-v-%version%-WIN

IF NOT EXIST %pathRelaseGame% (
	mkdir %pathRelaseGame%
)
cd %pathRelaseGame%
"%pathQt%\5.10.0\mingw53_32\bin\qmake.exe" %pathRepos%\Game-Scripts\Game.pro -spec win32-g++
"%pathQt%\Tools\mingw530_32\bin\mingw32-make.exe" qmake_all
"%pathQt%\Tools\mingw530_32\bin\mingw32-make.exe"
copy release\Game.exe %pathRepos%\Dependencies\Game\win32\Game.exe

cd %pathRepos%\RPG-Paper-Maker
call update-mods.bat

IF NOT EXIST %pathRelase% (
	mkdir %pathRelase%
)
cd %pathRelase%
::IF EXIST "Content" (
::	@RD /S /Q "Content"
::)
::"%pathQt%\5.10.0\mingw53_32\bin\qmake.exe" %pathRepos%\RPG-Paper-Maker\Engine.pro -spec win32-g++
::"%pathQt%\Tools\mingw530_32\bin\mingw32-make.exe" qmake_all
::"%pathQt%\Tools\mingw530_32\bin\mingw32-make.exe"
copy "release\RPG Paper Maker.exe" "%pathRepos%\Dependencies\Engine\win32\RPG Paper Maker.exe"

cd %pathRepos%\Releases-Provider
IF NOT EXIST result (
	mkdir result
)
cd result
IF EXIST %folderName% (
	@RD /S /Q "%folderName%"
)
mkdir %folderName%
cd %folderName%
echo r | C:\Windows\System32\xcopy.exe %pathRelase%\release\Content Content /E
echo r | C:\Windows\System32\xcopy.exe %pathRepos%\Dependencies\Engine\win32 %pathRepos%\Releases-Provider\result\%folderName% /E