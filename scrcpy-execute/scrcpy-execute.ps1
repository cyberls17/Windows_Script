Set-ExecutionPolicy Bypass

Write-Output "------------------------"
Write-Output "�޴��� ���� ���� ���α׷�"
Write-Output "------------------------"
Write-Output.
Write-Output "1. ���� ���� ���α׷� ����"
Write-Output "2. ���α׷� ����"
Write-Output.
$menu = Read-Host "�޴��� �Է��ϼ���" 

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