echo off

set /p input=Input : 
FOR %%i IN ("%input%") DO (
set filename=%%~ni
set fileextension=%%~xi
)

set /p start=Start (00:00:00.0): 
if "%start%" == "" (set start=0)
set /p duration=Duration (00:00:10.0):
if "%duration%" == "" (set duration=10)

ffmpeg -y -ss %start% -i %input% -c copy -t %duration% %filename%cut%fileextension%

pause