DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配

#If WinActive("ahk_exe wps.exe") ; for WPS Word 
  $^w::  ;convert to docx
    WinGetTitle, rtftitle, A
    If (InStr(rtftitle,".rtf ") >0 ) {
       SendInput, {F12}
       WinWait, ahk_class #32770
       Sleep, 500
       SendInput, !t{Down 3}{Enter 2}
    } 
  Return
  $^e::  ; Open LatexEE 101
    SendInput, !NJJ ; goto Latex Formula in WPS
    Sleep, 500
    DownListGet(10,"Latex")
  Return
  $^t::SendInput, !NXH ; insert text in WPS
  $^u::SendInput, !NUM ; insert symbol in WPS
  $^i::SendInput, !NPP ; insert images in WPS
  $^g::SendInput, !RGG ; revision in WPS word
#If

#If WinActive("ahk_exe wpp.exe") ; for WPS PPt 
  $^e::   ; Open LatexEE 101
    SendInput, !NJJ ; goto Latex Formula in WPS
    Sleep, 500
    DownListGet(10,"Latex")
  Return
  $^t::SendInput, !NXH ; insert text in WPS
  $^u::SendInput, !NUM ; insert symbol in WPS
  $^i::SendInput, !NPP ; insert images in WPS
  $^g::SendInput, !AC ; animation in WPS PPT
#If

#If WinActive("ahk_exe wordpad.exe") ; for word pad
  $^w::  ;convert to docx
    dir := LastDir()
    SendInput, !Fv>!x
    WinWait, ahk_class #32770
    Sleep, 500
    SendInput, %dir%{Enter}
    Sleep, 500
    SendInput,!s ;!y
  Return
#If
