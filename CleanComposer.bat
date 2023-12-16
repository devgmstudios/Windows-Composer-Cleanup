@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Count total vendor directories to be deleted
SET /A "dirCount=0"
FOR /r . %%d IN (composer.json) DO (
    IF EXIST "%%~dpdvendor\" SET /A "dirCount+=1"
)

REM Delete vendor directories and show progress
SET /A "progress=0"
FOR /r . %%d IN (composer.json) DO (
    IF EXIST "%%~dpdvendor\" (
        SET /A "progress+=1"
        SET /A "percent=!progress!*100/dirCount"
        ECHO Deleting: "%%~dpdvendor" [!percent!%%]
        rd /s /q "%%~dpdvendor"
    )
)

ENDLOCAL
