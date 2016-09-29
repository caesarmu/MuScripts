#NoEnv
#NoTrayIcon
#SingleInstance

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
If WinExist("Internet Explorer ahk_exe iexplore.exe") { 
    WinActivate, Internet Explorer ahk_exe iexplore.exe
    WinWait, Internet Explorer ahk_exe iexplore.exe,,10
    Sleep, 500
    WinGetText,htmltext,A
    Sleep, 200
    StringReplace, htmltext, htmltext, `r`n,%A_SPACE%, All
    inhtml=%1%
    If (InStr(htmltext,inhtml) >0) {
       SendInput, {F5}
    } Else {
       Run,"C:\Program Files\Internet Explorer\iexplore.exe" %inhtml%,,max
       Sleep, 500
       WinWait, Internet Explorer ahk_exe iexplore.exe,,10
       SendInput, #{Left}
    }  
} Else { 
    Run,"C:\Program Files\Internet Explorer\iexplore.exe" %1%,,max
    Sleep, 500
    WinWait, Internet Explorer ahk_exe iexplore.exe,,10
    SendInput, #{Left}
} 
ExitApp