#NoEnv
#NoTrayIcon
#SingleInstance

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
SplitPath, 1, htname,,htext,htbase
If ( htext = "html" ) {
   htkey := htname " ahk_exe iexplore.exe"
} Else If ( htext = "hta" ){
   htkey := htname " ahk_exe  mshta.exe"
}
If WinExist(htkey) { 
   WinActivate, %htkey%
   WinWait, %htkey%,,10
   SendInput, {F5} 
   ; hta will resize window when refresh
   ;StringReplace, htmltitles, htmltitle, `r`n,%A_SPACE%, All
} Else {
  If ( htext = "html" ) {
     RunWait, %ComSpec% /c taskkill /f /IM iexplore.exe, , Hide
     Run,"C:\Program Files\Internet Explorer\iexplore.exe" %1%
  } Else If ( htext = "hta" ){
     Run, %1%
  }   
  WinWait, %htkey%,,10
  SendInput, #{Left}
}
ExitApp