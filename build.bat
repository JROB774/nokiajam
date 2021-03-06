@echo off

.tcc\tcc -run src\DATPAK\DATPAK.C dat\FONT.PNG src\FONT.C NK_FONT
.tcc\tcc -run src\DATPAK\DATPAK.C dat\TILE.PNG src\TILE.C NK_TILE

if "%~1" == "" goto error

if %1 == win32 goto win32
if %1 == web goto web

goto error

:win32
if not exist bin\win32 mkdir bin\win32
.tcc\tcc %CompileFlags% -m32 -lwinmm -o bin\win32\SPACE-32.EXE src\WIN32.C res\icon32.res
.tcc\tcc %CompileFlags% -m64 -lwinmm -o bin\win32\SPACE-64.EXE src\WIN32.C res\icon64.res
goto quit

:web
if not exist bin\web mkdir bin\web
emcc src\WEB.C -s ALLOW_MEMORY_GROWTH=1 -s USE_SDL=2 -s USE_SDL_MIXER=2 --preload-file bin\web\SNDBANK -o bin\web\SPACE.html
goto quit

:error
echo Please provide a valid build profile: win32 or web

:quit
