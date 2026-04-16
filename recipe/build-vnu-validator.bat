@ECHO ON

set "LIBRARY_LIB=%PREFIX%\Library\lib"
set "LIBRARY_BIN=%PREFIX%\Library\bin"

cd "%SRC_DIR%"

if not exist "%LIBRARY_LIB%" mkdir "%LIBRARY_LIB%"  || exit 2

copy build\dist\vnu.jar "%LIBRARY_LIB%\vnu.jar"     || exit 3

if not exist "%LIBRARY_BIN%" mkdir "%LIBRARY_BIN%"  || exit 4

echo @ECHO OFF                                           > "%LIBRARY_BIN%\vnu.cmd"
echo java -jar "%LIBRARY_LIB%\vnu.jar" %%*              >> "%LIBRARY_BIN%\vnu.cmd"
echo IF %%ERRORLEVEL%% NEQ 0 EXIT /B %%ERRORLEVEL%%     >> "%LIBRARY_BIN%\vnu.cmd"

type %LIBRARY_BIN%\vnu.cmd                          || exit 5
