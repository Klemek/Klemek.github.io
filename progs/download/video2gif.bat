echo off
set /p input=Input file : 
FOR %%i IN ("%input%") DO (set filename=%%~ni)
set /p scale=Scale (480): 
if "%scale%" == "" (set scale=480)
set /p fps=FPS (20): 
if "%fps%" == "" (set fps=20)
ffmpeg -y -i %input% -vf fps=%fps%,scale=%scale%:-1:flags=lanczos,palettegen palette.png
if "%ERRORLEVEL%" NEQ "0" (goto :end)
ffmpeg -y -i %input% -i palette.png -filter_complex "fps=%fps%,scale=%scale%:-1:flags=lanczos[x];[x][1:v]paletteuse" temp.gif
if "%ERRORLEVEL%" NEQ "0" (goto :end)
gifsicle -O3 temp.gif -o %filename%.gif
:end
del palette.png
del temp.gif
pause