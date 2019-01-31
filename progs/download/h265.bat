echo off
set /p input=Input : 
FOR %%i IN ("%input%") DO (
set filename=%%~ni
set fileextension=%%~xi
)
ffmpeg -y -i %input% -c:v libx265 -preset medium -crf 28 -c:a aac -b:a 128k %filename%h265%fileextension%
pause