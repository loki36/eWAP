set rootpath=%~p0

call "%rootpath%"..\lock\pid.bat

rem ping 127.0.0.1 -n 2 > NUL

taskkill /T /FI "WINDOWTITLE eq %TASK%"

exit