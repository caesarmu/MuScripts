; set to be Unicode for chinese characters
#NoEnv
#NoTrayIcon
#SingleInstance
#Persistent  ; Keep the script running until the user exits it.
; To use #If...#If rather than If ..{...} to make some hotkeys only active for some window
; == always case sensitive while =,<> and != depend on  StringCaseSense on/off
; So I recommend: == and ! = for number and spacing compare and ~= and InStr for string compare
; = rather than := for string with quote

; Include files
#Include %A_ScriptDir%\AHKGui_Inc\AGI_Libs.ahk
#Include %A_ScriptDir%\AHKGui_Inc\AGI_List.ahk  ; varaible DriveName and DosHome needed
#Include %A_ScriptDir%\AHKGui_Inc\AGI_ListHtml.ahk ; variables DriveName, DosHome and browser needed
#Include %A_ScriptDir%\AHKGui_Inc\AGI_Notepad2Mod.ahk  ; variables DriveName and DosHome needed
#Include %A_ScriptDir%\AHKGui_Inc\AGI_SciSofts.ahk


; Global setting and variables
DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
Global passzip,DriveName,DosHome
SplitPath, A_ScriptFullPath,,,,,DriveName
DosHome := DriveName . "\Datas\Softs\DraftTools\dosbin"

; ShortCuts and functions
#If WinActive("ahk_exe explorer.exe")
  $!q:: 
    MsgBox,4,, Are your sure to Exit App?,30
    IfMsgBox, Yes 
    {
       ExitApp
    }
  Return
#If
$^Space:: SendInput, #{Space}  ;SwitchIME
^p::
  SwitchIME(0x08040804)
  Inputbox,inpass,PassWord,Enter the PassWord to Encrypt:,,280,140
  If(ErrorLevel != 0 || inpass == "" || passzip == "") {   ; push close or ESC or nothing Input
      Return
  }
  outpass := EncryPass(inpass,substr(passzip,3,1))
  Msgbox, Output PassWord: %outpass% 
Return
$^j::    ;  list them above
   Global pass1,pass2,pass3,pass4,pass5,pass6,pass7,pass8,pass9
   Global browser
   browser := "liebao.exe"
   If WinExist("ahk_class AutoHotkeyGUI") { ; for AutoHotkeyGUI
       WinActivate ; Activate the window it found
       WinWaitActive, ahk_class AutoHotkeyGUI,,10
       SetTimer, CloseGui, off
       SetTimer, OntopGui, off
       Gui, Menu:Destroy
       Return
    } 
  SwitchIME(0x08040804)
  If(FileExist("..\..\autohotkey\InWords.dat")) {
    Run, %ComSpec% /c del /q ..\..\autohotkey\InWords.dat,,Hide
  } 
  If(FileExist("..\..\autohotkey\InWords.zip")) { 
    Inputbox,passzip,PassWord,Enter the PassWord for zip file:,,280,140
    If(ErrorLevel != 0 || passzip == "") {   ; push close or ESC or nothing Input
      Return
    } 
    Run, "C:\Program Files\7-Zip\7z.exe" x ..\..\autohotkey\InWords.zip -o..\..\autohotkey\ -p%passzip%,,Hide 
    Loop, 7 {
      If(FileExist("..\..\autohotkey\InWords.dat")) {
        FileGetSize, filesize, ..\..\autohotkey\InWords.dat
        If( filesize > 0 ) {
           FileReadLine,InWords,..\..\autohotkey\InWords.dat,1
           Break
        } Else If(A_Index > 6) {
           Return
        } Else {
           Sleep, 500
        }
      } Else {
        If(A_Index > 6) {
           Return
        } Else {
           Sleep, 500
        }
      }
    }
    MyPass := StrSplit(InWords,"#")
    Run, %ComSpec% /c del /q ..\..\autohotkey\InWords.dat,,Hide
    pass1 := EncryPass(MyPass[1],-substr(passzip,3,1)) 
    pass2 := EncryPass(MyPass[2],-substr(passzip,3,1))
    pass3 := EncryPass(MyPass[3],-substr(passzip,3,1))
    pass4 := EncryPass(MyPass[4],-substr(passzip,3,1))
    pass5 := EncryPass(MyPass[5],-substr(passzip,3,1))
    pass6 := EncryPass(MyPass[6],-substr(passzip,3,1))
    pass7 := EncryPass(MyPass[7],-substr(passzip,3,1))
    pass8 := EncryPass(MyPass[8],-substr(passzip,3,1))
    pass9 := EncryPass(MyPass[9],-substr(passzip,3,1))
  }
  SetTimer, CloseGui, 36000000
  SetTimer, OntopGui, 5000
  Gui, Menu:Font, S11 Cred Bold, Microsoft Yahei
  Gui, Menu:Add, DropDownList, x0 y1 w86 h320 vFChoice gFolder Choose1, Folder|Affairs|Course|Dosbin|Draft|Drag|Manual|Paper|Project|Qsync|Report|Temp
  Gui, Menu:Add, DropDownList, x90 y1 w86 h460 vHChoice gHtml Choose1, Html|163mail|Amd10|GitHub|Gmail|Gpu3|InoRSS|JD|JH|LiveMail|NAS|Neu6|PMMP|Portal|QQMail|Rinse|SxuMail|SxuVPN|Taobao|TH2|VASP|WeChat
  Gui, Menu:Add, Button, x180 y1 w96 h25, Inkscape
  Gui, Menu:Add, Button, x280 y1 w66 h25, JabRef
  Gui, Menu:Add, Button, x350 y1 w46 h25, MS
  Gui, Menu:Add, DropDownList, x400 y1 w96 h360 vSChoice gSoft Choose1, Soft|CalCulator|CCleaner|EleTable|FileSync|Frozen|Gview|ICBC|PdfEdit|P4vasp|QQ|Qsync|TeamView|Vesta|Vsim|Wall|WeChat
  Gui, Menu:Add, Button, x500 y1 w46 h25, SSH
  Gui, Menu:Add, Button, x550 y1 w56 h25, Veusz
  Gui, Menu:Add, DropDownList, x610 y1 w96 h180 vCChoice gClose Choose1, Close|Exit|LockWin|Logoff|Reboot|Reload|ShutDown
  Gui, Menu:Show, xcenter y1 w700 h0,ShortCut Menu
  Gui, Menu:Color, FFFFFF
  Gui, Menu:+LastFound +AlwaysOnTop +Border -Caption -SysMenu +Owner
  WinSet, TransColor, FFFFFF
Return
OntopGui:
  Gui, Menu:+AlwaysOnTop
Return
CloseGui:
    Gui, Menu:Destroy
Return
 