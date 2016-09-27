; set to be Unicode for chinese characters
#NoEnv
#NoTrayIcon
#SingleInstance 
#Persistent  ; Keep the script running until the user exits it.
DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
; Global variables
Global doshome,passzip,Mutemp,browser,DriveName
SplitPath, A_ScriptFullPath,,,,,DriveName
doshome=%DriveName%\Datas\Softs\DraftTools\dosbin
Mutemp=D:\Temp\mutemp
browser=liebao.exe

$^Space:: SendInput, #{Space}  ;SwitchIME
$^j::    ;  list them above
   Global pass1,pass2,pass3,pass4,pass5,pass6,pass7,pass8,pass9
   If WinExist("ahk_class AutoHotkeyGUI") { ; for AutoHotkeyGUI
       WinActivate, ahk_class AutoHotkeyGUI
       WinWait, ahk_class AutoHotkeyGUI
       SetTimer, CloseGui, off
       SetTimer, OntopGui, off
       Gui, Destroy
       Return
    } 
  SwitchIME(0x08040804)
  If (FileExist("..\..\autohotkey\InWords.dat")) {
    Run, %ComSpec% /c del /q ..\..\autohotkey\InWords.dat
  } 
  If (FileExist("..\..\autohotkey\InWords.zip")) { 
    Inputbox,passzip,PassWord,Enter the PassWord for zip file:,,280,140
    If (ErrorLevel <>0 || passzip = "") {   ; push close or ESC or nothing Input
      Return
    } 
    Run, "C:\Program Files\7-Zip\7z.exe" x ..\..\autohotkey\InWords.zip -o..\..\autohotkey\ -p%passzip% 
    Loop, 7 {
      If (FileExist("..\..\autohotkey\InWords.dat")) {
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
    MyPass :=StrSplit(InWords,"#")
    Run, %ComSpec% /c del /q ..\..\autohotkey\InWords.dat
    pass1 :=EncryPass(MyPass[1],-substr(passzip,3,1)) 
    pass2 :=EncryPass(MyPass[2],-substr(passzip,3,1))
    pass3 :=EncryPass(MyPass[3],-substr(passzip,3,1))
    pass4 :=EncryPass(MyPass[4],-substr(passzip,3,1))
    pass5 :=EncryPass(MyPass[5],-substr(passzip,3,1))
    pass6 :=EncryPass(MyPass[6],-substr(passzip,3,1))
    pass7 :=EncryPass(MyPass[7],-substr(passzip,3,1))
    pass8 :=EncryPass(MyPass[8],-substr(passzip,3,1))
    pass9 :=EncryPass(MyPass[9],-substr(passzip,3,1))
  }
  SetTimer, CloseGui, 36000000
  SetTimer, OntopGui, 5000
  Gui, Font, S11 Cred Bold, Verdana 
  Gui,Add, DropDownList, x0 y1 w86 h320 vFChoice gFolder Choose1, Folder|Affairs|Course|Dosbin|Draft|Drag|Manual|Paper|Project|Qsync|Report|Temp
  Gui,Add, DropDownList, x90 y1 w86 h440 vHChoice gHtml Choose1, Html|163mail|Amd10|GitHub|Gmail|Gpu3|InoRSS|JD|JH|LiveMail|NAS|Neu6|PMMP|Portal|QQMail|Rinse|SxuMail|SxuVPN|Taobao|TH2|VASP|WeChat
  Gui,Add,Button,x180 y1 w96 h25, Inkscape
  Gui,Add,Button,x280 y1 w66 h25, JabRef
  Gui,Add,Button,x350 y1 w46 h25, MS
  Gui,Add, DropDownList, x400 y1 w96 h320 vSChoice gSoft Choose1, Soft|CalCulator|CCleaner|EleTable|FileSync|Frozen|Gview|ICBC|PdfEdit|QQ|Qsync|TeamView|Vesta|Vsim|Wall|WeChat
  Gui,Add,Button,x500 y1 w46 h25, SSH
  Gui,Add,Button,x550 y1 w56 h25, Veusz
  Gui,Add, DropDownList,x610 y1 w96 h160 vCChoice gClose Choose1, Close|Exit|LockWin|Logoff|Reboot|Reload|ShutDown
  Gui,Show,xcenter y1 w700 h0,ShortCut Menu
  Gui, Color, FFFFFF
  Gui,+LastFound +AlwaysOnTop +Border -Caption -SysMenu +Owner
  WinSet, TransColor, FFFFFF
Return
^p::
  SwitchIME(0x08040804)
  Inputbox,inpass,PassWord,Enter the PassWord to Encrypt:,,280,140
  If (ErrorLevel <>0 || inpass = "" || passzip = "") {   ; push close or ESC or nothing Input
      Return
  }
  outpass :=EncryPass(inpass,substr(passzip,3,1))
  Msgbox, Output PassWord: %outpass% 
Return

OntopGui:
  Gui, +AlwaysOnTop
Return
CloseGui:
    Gui, Destroy
Return
#Include %A_ScriptDir%\Lib_Gui_List.ahk  ; varaible DriveName needed
#Include %A_ScriptDir%\Lib_Gui_List_Html.ahk ; variables doshome, DriveName and browser needed
#Include %A_ScriptDir%\Lib_WPS.ahk
#Include %A_ScriptDir%\Lib_Notepad2Mod.ahk  ; variables doshome, DriveName and Mutemp needed
#Include %A_ScriptDir%\Lib_Sci_Softs.ahk
#Include %A_ScriptDir%\Lib_Explorer.ahk ; variables doshome and DriveName needed
#Include %A_ScriptDir%\Lib_Functions.ahk

 
