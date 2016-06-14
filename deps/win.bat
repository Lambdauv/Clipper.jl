cd %~dp0..\src\
CALL vcvarsall.bat amd64
cl.exe /D_USRDLL /D_WINDLL /EHsc cclipper.cpp clipper.cpp /MT /link /DLL /OUT:cclipper.dll
