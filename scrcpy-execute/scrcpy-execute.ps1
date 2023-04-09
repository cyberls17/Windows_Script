Set-ExecutionPolicy Bypass

Write-Output "------------------------"
Write-Output "휴대폰 원격 제어 프로그램"
Write-Output "------------------------"
Write-Output.
Write-Output "1. 원격 제어 프로그램 실행"
Write-Output "2. 프로그램 종료"
Write-Output.
$menu = Read-Host "메뉴를 입력하세요" 

if($menu -eq "1"){
    $port = 5554
    
}
    set port=5554
    for /L %%i in (151, 1, 3) do (
        adb connect 192.168.200.%%i:%port%
        %port% += 1
        timeout /t 2
        Write-Output %%i
        Write-Output %port%
        %port% += 1
    )
    timeout /t 1
    set x_loc=0
    for /L %%i in (151, 1, 3) do (
        scrcpy.exe -s 192.168.200.%%i --window-width=180 --window-x=%x_loc%
        %x_loc% += 180
    )
)
pause