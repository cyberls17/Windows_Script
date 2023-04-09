@echo off

echo ------------------------
echo 휴대폰 원격 제어 프로그램
echo ------------------------
echo.
echo 1. 원격 제어 프로그램 실행
echo 2. 프로그램 종료
echo.
set /p Input=메뉴 선택: 

if %Input% == 1 (
    set port=5554
    for /L %%i in (151, 1, 3) do (
        @REM adb connect 192.168.200.%%i:%port%
        @REM %port% += 1
        @REM timeout /t 2
        echo %%i
        echo %port%
        %port% += 1
    )
    timeout /t 1
    @REM set x_loc=0
    @REM for /L %%i in (151, 1, 3) do (
    @REM     scrcpy.exe -s 192.168.200.%%i --window-width=180 --window-x=%x_loc%
    @REM     %x_loc% += 180
    @REM )
)
pause