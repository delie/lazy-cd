@ECHO off
REM  lazy-cd
REM  https://github.com/Delie/lazy-cd/
REM  Windows batch file to aid quick & lazy directory switching!
REM  Written by Andrew Delicata - https://github.com/Delie

SET "targetDir="
SETLOCAL enabledelayedexpansion
SET v1=%1
SET v2=%2
SET /a index = 0

IF "%1%." =="." (
    ENDLOCAL
    DIR /o:g /o:n
    GOTO :eof
)
IF %1 == \ (
    ENDLOCAL
    CD\
    GOTO :eof
)
IF %1 == .. (
    ENDLOCAL
    CD..
    GOTO :eof
)
IF "%2." =="." SET /a %v2 = 1
FOR /d %%f in (%v1%*) do (
    SET /a index = index + 1
    IF !index! equ !v2! (
       ENDLOCAL
       SET targetDir=%%f
   )
)
ENDLOCAL
IF "%targetDir%." == "." (
    ECHO.
    ECHO No directories matched: %1
    GOTO :eof
)
CD %targetDir%

REM Uncomment the line below to perform a new DIR after changing directory
REM DIR /o:g /o:n

:eof
