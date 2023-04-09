import os, subprocess
from time import sleep

print("교육 기기 원격 제어 프로그램")
print("1. 기기 원격 제어 연결")
print("2. 프로그램 종료")
menu = int(input("메뉴를 입력하세요: "))

if menu == 1:
    device_id = 151
    port = 5554
    for i in range(3):
        if os.system(rf"C:\Users\학술정보관\Documents\GitHub\Windows_Script\scrcpy-execute\adb.exe connect 192.168.200.{device_id+i}:{port+i}") == 0:
            print(f"{i}번 기기 정상 연결되었습니다.")
        else:
            print(f"{i}번 기기 연결에 실패했습니다.")
        sleep(2)
    x = 0
    port = 5554
    for i in range(3):
        subprocess.Popen(rf"cmd /C C:\Users\학술정보관\Documents\GitHub\Windows_Script\scrcpy-execute\scrcpy.exe -s 192.168.200.{device_id+i}:{port+i} --window-width=180 --window-x={x}")
        x += 180
        sleep(3)

    
    