DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配

#If WinActive("ahk_exe VESTA.exe") ;  VESTA.exe
  $!c::
    SendInput, ^+b
    WinWait, Boundary,,10
    SendInput, {Tab 2}-1{Tab}2{Tab}-1{Tab}2{Tab 6}{Enter}
  Return
  $^i::
    SendInput,!F
    Sleep, 100
    SendInput, {Down 7}{Enter}
    WinWait, Export Raster Image,,10
    SendInput, {Enter}{Left}{Enter}
    WinWait, Export image,,10
    SendInput,{Del 5}5{Tab}{Enter}
    WinWait,Export Graphics,,10
    SendInput, {Enter}
  Return
  $!s::
    WinGetTitle, lasttitle, ahk_class CabinetWClass
    SwitchIME(0x08040804) 
    SendInput, ^+s
    WinWait, Save As ahk_class #32770,,10
    Sleep, 300
    SendInput, %lasttitle%.vesta
    SendInput, {Enter}
  Return
#If 

#If WinActive("Inkscape ahk_exe inkscape.exe") ;  inkscape.exe
  $!e::
     SendInput, ^!+S
     Sleep, 1000
     SendInput, !T{Down}{Down 7}!s
     Sleep, 1000
     SendInput,!o{Enter}
  Return
  $!p::
     SendInput, ^+e
     SendInput, !d
  Return
#If 

#If WinActive("ahk_exe JabRef.exe")
  $^r::    ; push citation key to Notepad2
    Clipboard=
    SendInput,^+K  ; copy cite key, close Ctrl+Shift+K in Bing Input first
    ClipWait, 2
    If WinExist(".tex ahk_exe Notepad2.exe") { ; for notepad2
       WinActivate, .tex ahk_exe Notepad2.exe
       WinWait, ahk_exe Notepad2.exe,,10
       SwitchIME(0x08040804) ; 中文(中国) 简体中文-美式键盘
       SendInput, \cite{{}%Clipboard%{}} 
    } Else If WinExist(".md ahk_exe Notepad2.exe") { ; for notepad2
       WinActivate, .md ahk_exe Notepad2.exe
       WinWait, ahk_exe Notepad2.exe,,10
       ;SwitchIME(0x04090409) ; 英语(美国) 美式键盘
       SwitchIME(0x08040804) 
       StringReplace, Clipboard, Clipboard, `,,;@, All
       SendInput, [@%Clipboard%] 
    }   
  Return 
  $^p:: SendInput, !e{Down 14}{Right}{Down}{Enter} ;set priority
  $^g:: SendInput, ^!a^g ; close ctrl+alt+a shortcut in QQ first
#If 