@echo off

.tcc\tcc -run src\DATPAK\DATPAK.C dat\FONT.PNG src\FONT.C NK_FONT
.tcc\tcc -run src\DATPAK\DATPAK.C dat\TILE.PNG src\TILE.C NK_TILE

if "%~1"=="" (
    echo Please provide a build profile: win32 or web
    exit /B
)

if %1 == win32 (
    if not exist bin\win32 mkdir bin\win32
    .tcc\tcc %CompileFlags% -D NK_DEBUG -lwinmm -o bin\win32\NOKIA.EXE src\WIN32.C
)
if %1 == web (
    if not exist bin\web mkdir bin\web
    emcc src\WEB.C -s ALLOW_MEMORY_GROWTH=1 -s USE_SDL=2 -s USE_SDL_MIXER=2 --preload-file bin\web\SNDBANK -o bin\web\NOKIA.html
)
