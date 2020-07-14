@echo off
title FixWin script made by BeanGreen247
echo ! The script has the following procedures.
echo ! The 1st procedure checks the disk - regular Checkdisk - 1 phase
echo ! The 2nd procedure checks and repairs the Windows Component Files - 2 phases
echo ! The 3rd procedure checks and repairs the Windows image - 4 phases
echo ! The 4th procedure uses System file check to check system files - 1 phase
echo ! In Windows 7 only CHKDSK and SFC work, the rest is new (Windows 8 +)
echo PRESS ANY KEY TO CONTINUE.
pause >null
del null
cls
echo Checking and fixing the Windows partition - procedure 1 of 4
chkdsk c: /scan
echo Fixing problems
chkdsk c: /f
del null
cls
echo Windows component files check - procedure 2 of 4
dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
echo Phase 1 of 2 completed
dism.exe /online /Cleanup-Image /SPSuperseded
echo Phase 2 of 2 completed
del null
cls
echo Checking the integrity of the Windows image - procedure 3 of 4
DISM /Online /Cleanup-Image /CheckHealth
echo Phase 1 of 3 completed
DISM /Online /Cleanup-Image /ScanHealth
echo Phase 2 of 3 completed
DISM /Online /Cleanup-Image /RestoreHealth
echo Phase 3 of 3 completed 
del null
cls
echo Running System file check - procedure 4 of 4
sfc /scannow
echo If SFC found some errors and could not repair, re-run the script after a reboot.
del null