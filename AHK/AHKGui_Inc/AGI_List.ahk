; Variable DriveName and DosHome defined in the main file

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配

Folder:    ; open Folders
  Gui,Menu:Submit,nohide
  ;Folder|Course|Dosbin|Draft|Drag|Manual|Paper|Qsync|Report|Temp
  If(FChoice ~= "Folder") {
      Run, %DriveName%\Datas,,max 
  } Else If(FChoice ~= "Affairs") {
      Run, %DriveName%\Datas\Affairs,,max
  } Else If(FChoice ~= "Course") {
      Run, %DriveName%\Datas\Affairs\Courses\Mat_Simu_Desg\Simulate_Design.%A_YYYY%,,max
  } Else If(FChoice ~= "Dosbin") {
      Run, %DosHome%,,max  
  } Else If(FChoice ~= "Draft") {
      Run, %DosHome%\Source\Notes\Drafts,,max
  } Else If(FChoice ~= "Drag") {
      Run, %DriveName%\Datas\Softs\DoNotSync\MobaXterm\MobaRoot\slash\tmp\dragdrop,,max
  } Else If(FChoice ~= "Manual") {
      Run, %DriveName%\Datas\Manuals,,max
  } Else If(FChoice ~= "Paper") {
      Run, %DriveName%\Datas\Papers,,max
  } Else If(FChoice ~= "Project") {
      Run, %DriveName%\Datas\Project,,max
  } Else If(FChoice ~= "Qsync") {
      Run, %DriveName%\Qsync,,max
  } Else If(FChoice ~= "Report") {
      Run, %DriveName%\Datas\Reports\SXU_%A_YYYY%,,max
  } Else If(FChoice ~= "Temp") {
      Run, %DriveName%\Temp\360chrome,,max
  } 
  GuiControl, Menu:Choose, FChoice, 1  
Return
Inkscape:    ; run Inkscape
    Gui,Menu:Submit,nohide
    If WinExist("Inkscape ahk_exe inkscape.exe") { 
       WinActivate
    } Else { 
       Run, %DosHome%\Inkscape\inkscape.exe, %DosHome%\Inkscape
    }
Return
JabRef:    ; run Jabref
    Gui,Menu:Submit,nohide 
    If WinExist("JabRef ahk_exe JabRef.exe") { 
       WinActivate
    } Else { 
       Run, "C:\Program Files\JabRef\JabRef.exe", C:\Program Files\JabRef
    } 
Return
MS:    ; run Materials Studio
    Gui,Menu:Submit,nohide
    If WinExist("MS8 - Materials Studio ahk_exe MatStudio.exe") { 
       WinActivate 
    } Else { 
       Run, "C:\Program Files (x86)\Accelrys\Materials Studio 8.0\bin\MatStudio.exe", C:\Program Files (x86)\Accelrys\Materials Studio 8.0\bin
    } 
Return 
Soft:    ; run soft not used very often
  Gui,Menu:Submit,nohide
  If(SChoice ~= "Soft") {
        Run, "C:\Program Files (x86)\kingsoft\kingsoft antivirus\ksoftmgr.exe" /source:17, C:\Program Files (x86)\kingsoft\kingsoft antivirus
  } Else If(SChoice ~= "CalCulator") { 
    If WinExist("SpeedCrunch ahk_exe speedcrunch.exe") { 
        WinActivate
    } Else { 
        Run, %DosHome%\SpeedCrunchPortable\SpeedCrunchPortable.exe, %DosHome%\SpeedCrunchPortable
    }
  } Else If(SChoice ~= "CCleaner") { 
    If WinExist("ahk_exe CCleaner64.exe") { 
        WinActivate
    } Else { 
        Run, "C:\Program Files\CCleaner\CCleaner64.exe", C:\Program Files\CCleaner
    }
  } Else If(SChoice ~= "FileSync") {
    If WinExist("ahk_class wxWindowNR ahk_exe FreeFileSync_x64.exe") {
        WinActivate
      } Else { 
        Run, %DriveName%\Datas\Softs\DoNotSync\FreeFileSync\FreeFileSync.exe, %DriveName%\Datas\Softs\DoNotSync\FreeFileSync
      }
  } Else If(SChoice ~= "Gview") {
    If WinExist("GaussView 5.0.9 ahk_exe gview.exe") {
        WinActivate
      } Else { 
        Run, C:\G09W\gview.exe, C:\G09W
      }
  } Else If(SChoice ~= "ICBC") {
    If WinExist("ahk_exe ICBCEBankAssist.exe") {
        WinActivate
      } Else { 
        Run, "C:\Program Files\ICBCEbankTools\ICBCSetupIntegration\ICBCEBankAssist.exe", C:\Program Files\ICBCEbankTools\ICBCSetupIntegration
      }
  } Else If(SChoice ~= "Frozen") {
      If WinExist("Warcraft III ahk_class Warcraft III") {
        WinActivate
      } Else { 
        Run, "%DriveName%\Datas\Softs\Warcraft III 1.24\Frozen Throne.exe", %DriveName%\Datas\Softs\Warcraft III 1.24
        Gui, Menu:Destroy
      } 
  } Else If(SChoice ~= "QQ") {
    If WinExist("QQ ahk_exe QQ.exe") {
        WinActivate
      } Else { 
        Run, "C:\Program Files (x86)\Tencent\QQLite\Bin\QQScLauncher.exe", C:\Program Files (x86)\Tencent\QQLite\Bin
      } 
  } Else If(SChoice ~= "Qsync") {
    Run, "C:\Program Files (x86)\QNAP\Qsync\Qsync.exe", C:\Program Files (x86)\QNAP\Qsync
  } Else If(SChoice ~= "EleTable") {
    If WinExist("Periodic Table ahk_exe ADPT.exe") {
        WinActivate
      } Else { 
        Run, "C:\Program Files (x86)\freshney.org\Periodic Table\ADPT.exe", C:\Program Files (x86)\freshney.org\Periodic Table
      } 
  } Else If(SChoice ~= "PdfEdit") {
    If WinExist("ahk_class GlassWndClass-GlassWindowClass-2") {
        WinActivate
      } Else {
        Run, "C:\Program Files (x86)\PDFsam Basic\pdfsam.exe", C:\Program Files (x86)\PDFsam Basic
      } 
  } Else If(SChoice ~= "P4vasp") {
    If WinExist("ahk_exe p4v.exe") {
        WinActivate
      } Else { 
        Run, %DosHome%\p4vasp\p4v.exe,%DosHome%\p4vasp
      } 
  } Else If(SChoice ~= "TeamView") {
    Run, "C:\Program Files (x86)\TeamViewer\TeamViewer.exe", C:\Program Files (x86)\TeamViewer
  } Else If(SChoice ~= "Vesta") {
    If WinExist("ahk_class wxWindowNR") {
        WinActivate
      } Else { 
        Run, %DosHome%\VESTA64\VESTA.exe,%DosHome%\VESTA64
      } 
  } Else If(SChoice ~= "Vsim") {
    If WinExist("Command panel ahk_exe v_sim.exe") {
        WinActivate
      } Else { 
        Run, %DosHome%\v_sim\bin\v_sim.exe,%DosHome%\v_sim\bin 
        WinWaitActive, ahk_exe v_sim.exe
        WinHide, ahk_class ConsoleWindowClass
      } 
  } Else If(SChoice ~= "Wall") {
        Run, %DosHome%\Source\Notes\Wall.exe.lnk
  } Else If(SChoice ~= "WeChat") {
    If WinExist("ahk_exe WeChat.exe") {
        WinActivate
      } Else { 
        Run, "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe", C:\Program Files (x86)\Tencent\WeChat
      } 
  }
  GuiControl, Menu:Choose, SChoice, 1
Return
SSH:    ; run ssh MobaXterm
    Gui,Menu:Submit,nohide
    If WinExist("ahk_class TMobaXtermForm") {
       WinActivate
    } Else { 
       Run, %DriveName%\Datas\Softs\DoNotSync\MobaXterm\MobaXterm_Personal.exe, %DriveName%\Datas\Softs\DoNotSync\MobaXterm
    }
Return 
Veusz:    ; run plot soft Veusz
    Gui,Menu:Submit,nohide
    If WinExist("Veusz ahk_exe veusz.exe") {
       WinActivate
    } Else { 
       Run, "C:\Program Files (x86)\Veusz\veusz.exe", C:\Program Files (x86)\Veusz
    }  
Return
Close:    ; Reboot, shutdown
  Gui,Menu:Submit,nohide
  If(CChoice ~= "Close") {
    SetTimer, CloseGui, off
    SetTimer, OntopGui, off
    Gui, Menu:Destroy
  } Else If(CChoice ~= "Exit") {
    MsgBox,4,, Are your sure to Exit App?,30
    IfMsgBox, Yes 
    {
       ExitApp
    }
  } Else If(CChoice ~= "LockWin") {
    Run, C:\Windows\System32\rundll32.exe user32.dll LockWorkStation 
  } Else If(CChoice ~= "Logoff") {
    MsgBox,4,, Are your sure to Logoff?,30
    IfMsgBox, Yes 
    {
      Shutdown, 0
    }
  } Else If(CChoice ~= "ShutDown") {
    MsgBox,4,, Are your sure to Shut Down?,30
    IfMsgBox, Yes 
    {
      Shutdown, 1
    }
  } Else If(CChoice ~= "Reload") {
    Reload
  } Else If(CChoice ~= "Reboot") {
    MsgBox,4,, Are your sure to Reboot?,30
    IfMsgBox, Yes 
    {
      Shutdown, 2
    }
  }
  GuiControl, Menu:Choose, CChoice, 1
Return
