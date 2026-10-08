@echo off

REM setup run directory
mkdir run
mkdir run\mods

REM create dummy jar file with just meta-inf
IF EXIST build RMDIR /q /s build
IF EXIST "run\mods\TinkersBags-Dummy.jar" DEL "run\mods\TinkersBags-Dummy.jar"
mkdir build
XCOPY src\META-INF build\META-INF /s /i /q
copy src\pack.mcmeta build
copy src\pack.png build
cd build
jar --create --file ../run/mods/TinkersBags-Dummy.jar *
cd ..
REM Removing build directory
RMDIR /q /s build

REM create symlinks so resources live update
mkdir run\thingpacks
cd run\thingpacks
IF NOT EXIST TinkersBags mklink /J TinkersBags ..\..\src
IF NOT EXIST TinkersBagsGenerated mklink /J TinkersBagsGenerated ..\..\generated
cd ..\..