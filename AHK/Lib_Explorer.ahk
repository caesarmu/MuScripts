; variables doshome and DriveName defined in main file 

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
#If WinActive("ahk_exe explorer.exe")
  $^b::    ; open  115.24.3.201:1215
    Run, %DriveName%\Qsync\Refs4Mu\Tasks\Tasks_self.html
    WinWait, Tasks for Yuewen Mu
    Run, %USERPROFILE%\AppData\Local\360Chrome\Chrome\Application\360chrome.exe 115.24.3.201:1215
    WinWait, 115.24.3.201:1215
    SwitchIME(0x08040804) 
    SendInput, %pass4%{Enter}
    Run, %USERPROFILE%\AppData\Local\360Chrome\Chrome\Application\360chrome.exe 115.24.3.201:1215
    WinWait, 115.24.3.201:1215
    SendInput, %pass6%{Enter}
  Return 
  $^t::    ; run SpeedCrunchPortable.exe
    Run, %doshome%\SpeedCrunchPortable\SpeedCrunchPortable.exe
  Return
  $^m::    ; run Materials Studio
    Run, "C:\Program Files (x86)\Accelrys\Materials Studio 8.0\bin\MatStudio.exe"
  Return    
  $^s::    ; run ssh MobaXterm
    Run, %DriveName%\Datas\Softs\DoNotSync\MobaXterm\MobaXterm_Personal.exe
  Return 
#If 
 
 
