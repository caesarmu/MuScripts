; set to be Unicode for chinese characters
#NoEnv
#NoTrayIcon
#SingleInstance 
#Persistent  ; Keep the script running until the user exits it.
DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
; Global variables
Global doshome,passin,Mutemp,browser,DriveName
SplitPath, A_ScriptFullPath,,,,,DriveName
doshome=%DriveName%\Datas\Softs\DraftTools\dosbin
passin=1215
Mutemp=D:\Temp\mutemp
browser=360chrome.exe


$!q:: ExitApp  ; exit app
$^Space:: SendInput, #{Space}  ;SwitchIME
$^j::    ;  list them above
   Global pass1,pass2,pass3,pass4,pass5,pass6,pass7,pass8
   If WinExist("ahk_class AutoHotkeyGUI") { ; for AutoHotkeyGUI
       WinActivate, ahk_class AutoHotkeyGUI
       WinWait, ahk_class AutoHotkeyGUI
       SetTimer, CloseGui, off
       SetTimer, OntopGui, off
       Gui, Destroy
       Return
    } 
  SwitchIME(0x08040804)
  Inputbox,passwd,PassWord,Enter the PassWord:,,180,140
  If (ErrorLevel <>0 || passwd = "" || passwd <> passin ) {   ; push close or ESC or nothing Input
      Return
  } 
  SetTimer, CloseGui, 36000000
  SetTimer, OntopGui, 5000
  Gui, Font, S11 Cred Bold, Verdana 
  Gui,Add, DropDownList, x0 y1 w86 h300 vFChoice gFolder Choose1, Folder|Course|Dosbin|Draft|Drag|LaTEX|Manual|Paper|Project|Qsync|Report|Temp|Work
  Gui,Add, DropDownList, x90 y1 w86 h340 vHChoice gHtml Choose1, Html|163mail|Amd10|Gmail|Gpu3|JD|JH|LiveMail|NAS|Neu6|PMMP|Portal|QQMail|SxuMail|Taobao|TH2|VASP
  Gui,Add,Button,x180 y1 w96 h25, Inkscape
  Gui,Add,Button,x280 y1 w66 h25, JabRef
  Gui,Add,Button,x350 y1 w46 h25, MS
  Gui,Add, DropDownList, x400 y1 w96 h300 vSChoice gSoft Choose1, Soft|CalCulator|Clean|EleTable|FileSync|Frozen|Gview|PdfEdit|QQ|Qsync|RSS|TeamView|Vesta|Vsim|Wifi
  Gui,Add,Button,x500 y1 w46 h25, SSH
  Gui,Add,Button,x550 y1 w56 h25, Veusz
  Gui,Add, DropDownList,x610 y1 w96 h160 vCChoice gClose Choose1, Close|Exit|LockWin|Logoff|Reboot|Reload|ShutDown
  Gui,Show,xcenter y1 w700 h0,ShortCut Menu
  Gui, Color, FFFFFF
  Gui,+LastFound +AlwaysOnTop +Border -Caption -SysMenu +Owner
  WinSet, TransColor, FFFFFF
Return

OntopGui:
  Gui, +AlwaysOnTop
Return
CloseGui:
    Gui, Destroy
Return
#Include %A_ScriptDir%\Lib_Gui_List.ahk  ; varaible DriveName needed
#Include %A_ScriptDir%\Lib_Gui_List_Html.ahk ; variables doshome and browser needed
#Include %A_ScriptDir%\Lib_WPS.ahk
#Include %A_ScriptDir%\Lib_Notepad2Mod.ahk  ; variables doshome, DriveName and Mutemp needed
#Include %A_ScriptDir%\Lib_Sci_Softs.ahk
#Include %A_ScriptDir%\Lib_Explorer.ahk ; variables doshome and DriveName needed
#Include %A_ScriptDir%\Lib_Functions.ahk

 
