;variables doshome, DriveName and Mutemp defined in main file

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
#If WinActive("ahk_exe Notepad2.exe") ; for notepad2
  $^q::SendInput, !l  ; shortcut to Alt+L, open with...
  $^l::     ; set file to readonly in Notepad2 (lock)
    SendInput, !F
    Sleep, 10
    SendInput, {Down 6}{Enter}
  Return
  $^r:: ; add command and arguments to Ctrl+r in Notepad2, to replace pause 
    SwitchIME(0x08040804) 
    SendInput,  ^r   
    WinWait, ahk_class #32770
    SendInput, {Home}DoIt.bat{Space 2}{End}{Space 2}pause 
  Return 
  $^g:: ; grammer check one  line 
    WinGetTitle, nptitle, A
    If (InStr(nptitle,".md ") >0 || InStr(nptitle,".tex ") >0) {
      ingram=%Mutemp%\SpellCheckTmp.dat
      If FileExist(ingram) {
         FileDelete, %ingram%
      }
      Sleep, 500
      SwitchIME(0x08040804)
      ControlGet, SelStr, Selected,,,A 
      If (SelStr = "") { 
        Clipboard=
        SendInput,^+c  ; copy line
        ClipWait, 2
      } Else { 
        Clipboard=%SelStr% ; cut Selected
      }  
      FileAppend, %Clipboard%, %ingram%
      Run, %ComSpec% /c java -Xmx512m -jar %doshome%\LanguageTool\languagetool-commandline.jar -l en-US %ingram%  && pause
    }
  Return 
  $^s::
    SendInput, ^s
    WinGetTitle, nptitle, A
    If (InStr(nptitle,".md ") >0 && InStr(nptitle,"\mutemp")=0) {
       SendInput, ^m
    } 
  Return
  $^m:: SendInput, ^s^m ; save before to excute
  $^f:: SendInput, ^h ; open replace rather than find panel 
  
; add shortcuts of vim for Notepad2, use ! 
  $!Up:: SendInput, ^+{Up}{End} ; move the line up
  $!Down:: SendInput, ^+{Down}{Home} ; move the line Down
  $!w:: SendInput, ^s ; save
  $!s:: SendInput, ^s ; save
  $!m:: SendInput, ^b ; find match 
  $!u:: SendInput, ^z  ; undo 
  $!r:: SendInput, ^y  ; redo
  $!i:: SendInput, ^!u ; invert case 
  $!p:: SendInput, {End}{Enter}^v{Del} ; paste at next line                                                                        
  $!d:: 
    ControlGet, SelStr, Selected,,,A 
    If (SelStr = "") { 
        Clipboard=
        SendInput,^+x  ; cut line
        ClipWait, 2
    } Else { 
        Clipboard=%SelStr%`n  ; cut Selected
        SendInput, {Del}
    }    
  Return 
  $!y::
    ControlGet, SelStr, Selected,,,A 
    If (SelStr = "") { 
        Clipboard=
        SendInput,^+c  ; copy line
        ClipWait, 2
    } Else { 
        Clipboard=%SelStr%`n  ; copy Selected
    }    
  Return
  
  ; other Functions
  $^t::
    SendInput, ^s
    WinGetTitle, nptitle, A
    If (InStr(nptitle,".md ") =0 ) {
        Return
    }
    Inputbox,Tabpara,Table Parameters,Enter the number of columns`, number of rows (Default: 6) and column width (Default: 8):,,300,150
    If (ErrorLevel <>0 || Tabpara = "") {   ; push close or ESC or nothing Input
       Return
    }
    StringReplace,Tabpara,Tabpara,%A_SPACE%%A_SPACE%%A_SPACE%,%A_SPACE%
    StringReplace,Tabpara,Tabpara,%A_SPACE%%A_SPACE%,%A_SPACE%
    Tabparalist :=StrSplit(Tabpara,A_SPACE)
    If ( Tabparalist[1] = "0" || Tabparalist[1] = "" ) {
       Return
    } Else {
       numcol :=Tabparalist[1]
    }
    If ( Tabparalist[2] = "0" || Tabparalist[2] = "" ) {
       numrow :=6
    } Else {
       numrow :=Tabparalist[2]
    }
    If ( Tabparalist[3] = "0" || Tabparalist[3] = "" ) {
       colwidth :=8
    } Else {
       colwidth :=Tabparalist[3]
    }
    npkey := SubStr(nptitle,1,5)
    WinActivate, %npkey% ahk_exe Notepad2.exe
    WinWait, %npkey% ahk_exe Notepad2.exe
    SendInput,`n{Home 2}|
    Loop, %numcol%  {
          spacecol1 :=Ceil((colwidth-4)/2)
          spacecol2 :=colwidth-4-spacecol1
          SendInput,{Space %spacecol1%}}Name{Space %spacecol2%}|
    }
    SendInput,`n{Home 2}|
    Loop, %numcol%  {
           Loop, %colwidth% {
                  SendInput,-
           }
           SendInput,|
    }
    Loop, %numrow%  {
          SendInput,`n{Home 2}|
          Loop, %numcol%  {
          SendInput,{Space %colwidth%}|
          }
     }
    SendInput,`n{Home 2}:Table: New Table `n
  Return
  $^i:: SendInput,{!}{[}$\alpha${]}(%doshome%\models\logo.png "png"){{}width=50`%{}}
  $^h:: Run, %doshome%\MyTasks\Symbols4Tex_math.html
#If