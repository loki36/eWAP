SET TASK=%RANDOM%-PHP-SERVER-%RANDOM%

set rootpath=%~p0

FOR /F "usebackq tokens=1-2 delims==" %%i in ("%rootpath%config/configue.ini") DO (
set %%i=%%j
)

if not %WEBAPPPATH% == "" (
set WEBAPPPATH="%rootpath%%WEBAPPPATH%"
)

if not %ROUTER% == "" (
set ROUTER="%rootpath%%ROUTER%"
)

echo set TASK=%TASK%> "%rootpath%"lock\pid.bat

rem start "%TASK%" "%rootpath%"external_source\%PHPWINVERSION%\php -S %HOST%:%PORT% -c external_source\%PHPWINVERSION%\php.ini-production -t "%rootpath%app\"
rem start "%TASK%" "%rootpath%"external_source\%PHPWINVERSION%\php -S %HOST%:%PORT% -t %WEBAPPPATH%

cd %WEBAPPPATH%
start "%TASK%" "%rootpath%"external_source/%PHPWINVERSION%/php -S %HOST%:%PORT% %ROUTER%
cd %rootpath%


start http://%HOST%:%PORT%/%URL%

rem taskkill /T /FI "WINDOWTITLE eq %TASK%"