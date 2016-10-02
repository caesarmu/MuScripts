#NoEnv
#NoTrayIcon
#SingleInstance

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
SplitPath, 1, htmlname
htmlkey := htmlname " ahk_exe iexplore.exe"
If WinExist(htmlkey) { 
    WinActivate, %htmlname% ahk_exe iexplore.exe
    WinWait, %htmlname% ahk_exe iexplore.exe,,10
    SendInput, {F5}
    ;StringReplace, htmltitles, htmltitle, `r`n,%A_SPACE%, All
} Else {
    RunWait, %ComSpec% /c taskkill /f /IM iexplore.exe, , Hide
    Run,"C:\Program Files\Internet Explorer\iexplore.exe" %1%
    WinWait, %htmlname% ahk_exe iexplore.exe,,10
    SendInput, #{Left}
}
ExitApp