@ECHO OFF
CLS
ECHO.
ECHO ICHOR BUILDER
ECHO ...............................................
ECHO MAKE YOUR SELECTION
ECHO ...............................................
ECHO.
ECHO 1 - Build all
ECHO 2 - Build all without CD music
ECHO 3 - Build BLOOD.RFF
ECHO 4 - Build SOUNDS.RFF
ECHO 5 - Build GUI.RFF
ECHO 6 - Exit
ECHO.
CHOICE /C:123456
IF ERRORLEVEL 1 SET M=1
IF ERRORLEVEL 2 SET M=2
IF ERRORLEVEL 3 SET M=3
IF ERRORLEVEL 4 SET M=4
IF ERRORLEVEL 5 SET M=5
IF ERRORLEVEL 6 SET M=6
IF %M%==1 GOTO ALL
IF %M%==2 GOTO ALLNOCD
IF %M%==3 GOTO BLOOD
IF %M%==4 GOTO SOUNDS
IF %M%==5 GOTO GUI
IF %M%==6 GOTO GOODBYE
:ALL
barfc BLOOD.RFF -a @BLOOD.RFS
barfc SOUNDS.RFF -a @SOUNDS.RFS
barfc GUI.RFF -a @GUI.RFS
7za a -tzip ..\cdmusic.zip *.* *
mkdir ..\RELEASE
MOVE /Y ..\BLOOD.RFF ..\RELEASE
MOVE /Y ..\SOUNDS.RFF ..\RELEASE
MOVE /Y ..\GUI.RFF ..\RELEASE
MOVE /Y ..\cdmusic.zip ..\RELEASE
GOTO GOODBYE
:ALLNOCD
barfc BLOOD.RFF -a @BLOOD.RFS
barfc SOUNDS.RFF -a @SOUNDS.RFS
barfc GUI.RFF -a @GUI.RFS
mkdir ..\RELEASE
MOVE /Y ..\BLOOD.RFF ..\RELEASE
MOVE /Y ..\SOUNDS.RFF ..\RELEASE
MOVE /Y ..\GUI.RFF ..\RELEASE
GOTO GOODBYE
:BLOOD
barfc BLOOD.RFF -a @BLOOD.RFS
mkdir ..\RELEASE
MOVE /Y ..\BLOOD.RFF ..\RELEASE
GOTO GOODBYE
:SOUNDS
barfc SOUNDS.RFF -a @SOUNDS.RFS
mkdir ..\RELEASE
MOVE /Y ..\SOUNDS.RFF ..\RELEASE
GOTO GOODBYE
:GUI
barfc GUI.RFF -a @GUI.RFS
mkdir ..\RELEASE
MOVE /Y ..\GUI.RFF ..\RELEASE
GOTO GOODBYE
:GOODBYE
echo Thank you!
wait
