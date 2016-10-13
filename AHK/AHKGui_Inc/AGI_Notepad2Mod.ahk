;variables DriveName defined in main file

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
    Global DriveName,DosHome
    SplitPath, A_ScriptFullPath,,,,,DriveName
    DosHome := DriveName . "\Datas\Softs\DraftTools\dosbin"
    SwitchIME(0x08040804)
    FilePath := NpPath()
    SplitPath,FilePath,Fname,Fdir,Fext,Fbase
    If(Fext ~= "md"){
       Gui, Tool:Font, S15 Cred Bold, Microsoft Yahei
       Gui, Tool:Add, Checkbox,x20 y0 w500 h30 vIsPause, Need More Information?
       Gui, Tool:Add, Button, x20 y35 w200 h30 gCompiler, % "RTF"
       Gui, Tool:Add, Button, x230 y35 w200 h30 gCompiler, % "ODT"
       Gui, Tool:Add, Button, x440 y35 w200 h30 gCompiler, % "DOCX"
       Gui, Tool:Add, Button, x20 y70 w200 h30 gCompiler, % "EPU"
       Gui, Tool:Add, Button, x230 y70 w200 h30 gCompiler, % "OPML"
       Gui, Tool:Add, Button, x440 y70 w200 h30 gCompiler, % "WPS"
       Gui, Tool:Add, Button, x20 y105 w200 h30 gCompiler, % "BEAM"
       Gui, Tool:Add, Button, x230 y105 w200 h30 gCompiler, % "MBEAM"
       Gui, Tool:Add, Button, x440 y105 w200 h30 gCompiler, % "SELF"
       Gui, Tool:Add, Button, x20 y140 w200 h30 gCompiler, % "MATH"
       Gui, Tool:Add, Button, x230 y140 w200 h30 gCompiler, % "OMATH"
       Gui, Tool:Add, Button, x440 y140 w200 h30 gCompiler, % "DeFAULT"
       Gui, Tool:Add, Button, x20 y175 w200 h30 gCompiler, % "SLIDE"
       Gui, Tool:Add, Button, x230 y175 w200 h30 gCompiler, % "PDF"
       Gui, Tool:Add, Button, x440 y175 w200 h30 gCompiler, % "CLOSE"
       Gui, Tool:Show, AutoSize Center,Complier Panel for %Fext%
       Gui, Tool:Color, FFFFFF
       Gui, Tool:+LastFound +AlwaysOnTop +Border -SysMenu
      }Else If(Fext ~= "tex"){
       Gui, Tool:Font, S15 Cred Bold, Microsoft Yahei
       Gui, Tool:Add, Checkbox,x20 y0 w500 h30 vIsPause, Need More Information?
       Gui, Tool:Add, Button, x20 y35 w200 h30 gCompiler, % "PdfLaTex"
       Gui, Tool:Add, Button, x20 y70 w200 h30 gCompiler, % "XeLaTeX"
       Gui, Tool:Add, Button, x230 y35 w200 h30 gCompiler, % "LaTeX"
       Gui, Tool:Add, Button, x230 y70 w200 h30 gCompiler, % "Default"
       Gui, Tool:Add, Button, x105 y105 w200 h30 gCompiler, % "Close"
       Gui, Tool:Show, AutoSize Center,Complier Panel for %Fext%
       Gui, Tool:Color, FFFFFF
       Gui, Tool:+LastFound +AlwaysOnTop +Border -SysMenu
    }

    ;SendInput,  ^r   
    ;WinWaitActive, ahk_class #32770,,10
    ;SendInput, {Home}DoIt.bat{Space 2}{End}{Space 2}self 
  Return 
  $^g:: ; grammer check one  line 
    If( WinActive(".md ahk_exe Notepad2.exe") || WinActive(".tex ahk_exe Notepad2.exe")) {
      ingram=%DosHome%\LanguageTool\SpellCheckTmp.dat
      If (FileExist(ingram) != "") {
         FileDelete, %ingram%
      }
      Sleep, 500
      SwitchIME(0x08040804)
      ControlGet, SelStr, Selected,,,A 
      If(SelStr = "") { 
        Clipboard := ""
        SendInput,^+c  ; copy line
        ClipWait, 2
      } Else { 
        Clipboard := SelStr ; cut Selected
      }  
      FileAppend, %Clipboard%, %ingram%
      Run, %ComSpec% /c java -Xmx512m -jar %DosHome%\LanguageTool\languagetool-commandline.jar -l en-US %ingram%  && pause
    }
  Return 
  $^s::
    SendInput, ^s
    WinGetTitle, nptitle, A
    If(InStr(nptitle,".md ") >0 && InStr(nptitle,"\mutemp")=0) {
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
    If(SelStr = "") { 
        Clipboard := ""
        SendInput,^+x  ; cut line
        ClipWait, 2
    } Else { 
        Clipboard := SelStr . "`n"  ; cut Selected
        SendInput, {Del}
    }    
  Return 
  $!y::
    ControlGet, SelStr, Selected,,,A 
    If(SelStr = "") { 
        Clipboard := ""
        SendInput,^+c  ; copy line
        ClipWait, 2
    } Else { 
        Clipboard := SelStr . "`n"  ; copy Selected
    }    
  Return
  
  ; other Functions
  $^t::
    SendInput, ^s
    If(Not WinActive(".md ahk_exe Notepad2.exe")) {
        Return
    }
    Inputbox,Tabpara,Table Parameters,Enter the number of columns`, number of rows (Default: 6) and column width (Default: 8):,,300,150
    If(ErrorLevel <>0 || Tabpara = "") {   ; push close or ESC or nothing Input
       Return
    }
    Tabpara := StrReplace(Tabpara, A_SPACE . A_SPACE . A_SPACE, A_SPACE)
    Tabpara := StrReplace(Tabpara, A_SPACE . A_SPACE, A_SPACE)
    Tabparalist := StrSplit(Tabpara,A_SPACE)
    If( Tabparalist[1] = "0" || Tabparalist[1] = "" ) {
       Return
    } Else {
       numcol := Tabparalist[1]
    }
    If( Tabparalist[2] = "0" || Tabparalist[2] = "" ) {
       numrow := 6
    } Else {
       numrow := Tabparalist[2]
    }
    If( Tabparalist[3] = "0" || Tabparalist[3] = "" ) {
       colwidth := 8
    } Else {
       colwidth := Tabparalist[3]
    }
    SendInput,`n{Home 2}|
    Loop, %numcol%  {
          spacecol1 := Ceil((colwidth-4)/2)
          spacecol2 := colwidth-4-spacecol1
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
          SendInput,{Space %spacecol1%}}0000{Space %spacecol2%}|
          }
     }
    SendInput,`n{Home 2}:Table: New Table `n
  Return
  $^i:: SendInput,{!}{[}$\alpha${]}(%DosHome%\models\logo.png "png"){{}width=50`%{}}
  $^h:: Run, %DosHome%\Source\Notes\Symbols4Tex_math.html
  Compiler:
    Gui, Tool:Submit, Hide
    StringLower, TaskType, A_GuiControl
    If(TaskType ~= "close"){
       Gui,Tool:Destroy
       Return
    }
    If(IsPause){
       PauseCmd := "pause"
       IsHide := ""
    }Else {
       PauseCmd := ""
       IsHide := "Hide"
    }
    IsPause := ""
    Run, %DosHome%\AutoHotkey.exe %DosHome%\MyAHK\AHKCmd.ahk %FilePath% %TaskType%_%PauseCmd%,%Fdir%,%IsHide%
    Gui, Tool:Destroy
  Return  
#If

