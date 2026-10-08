@echo off

IF EXIST build RMDIR /q /s build
IF EXIST "TinkersBags-#.#.#.jar" DEL "TinkersBags-#.#.#.jar"
MKDIR build

REM Copy required files into build directory
XCOPY src build /s /i /q
XCOPY generated\assets build\assets /s /i /q

REM Zipping contents
cd build
REM TODO: locate version number from mods.toml
jar --create --file ../TinkersBags-#.#.#.jar *
cd ..

REM Removing build directory
RMDIR /q /s build
