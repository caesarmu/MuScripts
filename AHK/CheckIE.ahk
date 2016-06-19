#NoEnv
#NoTrayIcon
#SingleInstance

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
If WinExist("Internet Explorer ahk_exe iexplore.exe") { 
    WinActivate, Internet Explorer ahk_exe iexplore.exe
    WinWait, Internet Explorer ahk_exe iexplore.exe
    WinGetText,htmltext,A
    StringReplace, htmltext, htmltext, `r`n,%A_SPACE%, All
    inhtml=%1%
    If (InStr(htmltext,inhtml) >0) {
       SendInput, {F5}
    } Else {
       Run,"C:\Program Files\Internet Explorer\iexplore.exe" %inhtml%,,max
    }  
} Else { 
    Run,"C:\Program Files\Internet Explorer\iexplore.exe" %1%,,max
} 
ExitApp