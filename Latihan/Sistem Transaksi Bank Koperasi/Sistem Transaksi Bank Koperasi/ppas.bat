@echo off
c:\dev-pas\bin\ldw.exe  -s   -o d:\projec~1\projec~1\sistem~1\koperasi.exe link.res exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
