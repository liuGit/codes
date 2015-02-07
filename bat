@echo off
setlocal enabledelayedexpansion

set dir=%~dp0
set Find=0



echo ================================
call :praseInI server_1 ip
echo ++++++++++++++++++++++++++++++++
call :praseInI server_1 user
echo ++++++++++++++++++++++++++++++++
call :praseInI server_1 passwd


goto END


:praseInI
	for /f "tokens=1 delims=[" %%i in (%dir%\a.ini) do (
		rem echo %%i
		if !Find! EQU 0 (
			for /f "delims=]" %%j in ("%%i") do (
				if "%%j"=="%1" (
					set Find=1
				)
			)
		)
	
		for /f "tokens=1,2 delims==" %%a in ("%%i") do (
			if "%%a"=="%2" ( 
				if !Find! EQU 1 (
					echo %%b
					set Find=0
					goto :eof
				)
			)
		)
	)
goto :eof


:END
pause




	
