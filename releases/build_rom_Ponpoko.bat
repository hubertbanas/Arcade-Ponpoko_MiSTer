@echo off

set    zip=ponpoko.zip
set ifiles=ppokoj1.bin+ppokoj2.bin+ppokoj3.bin+ppokoj4.bin+ppoko5.bin+ppoko6.bin+ppoko7.bin+ppokoj8.bin+ppoko9.bin+ppoko10.bin
set  ofile=a.ponpok.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
