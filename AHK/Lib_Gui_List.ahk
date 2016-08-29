; Variable DriveName defined in the main file

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配

Folder:    ; open Folders
  Gui,submit,nohide
  ;Folder|Course|Dosbin|Draft|Drag|Manual|Paper|Qsync|Report|Temp
  If (FChoice = "Folder") {
      Run, %DriveName%\Datas,,max 
  } Else If (FChoice = "Course") {
      Run, %DriveName%\Datas\Affairs\Courses\Mat_Simu_Desg\Simulate_Design.%A_YYYY%,,max
  } Else If (FChoice = "Dosbin") {
      Run, %doshome%,,max  
  } Else If (FChoice = "Draft") {
      Run, %doshome%\MyTasks\Drafts,,max
  } Else If (FChoice = "Drag") {
      Run, %DriveName%\Datas\Softs\DoNotSync\MobaXterm\MobaRoot\slash\tmp\dragdrop,,max
  } Else If (FChoice = "Manual") {
      Run, %DriveName%\Datas\Manuals,,max
  } Else If (FChoice = "Paper") {
      Run, %DriveName%\Datas\Papers,,max
  } Else If (FChoice = "Project") {
      Run, %DriveName%\Datas\Project,,max
  } Else If (FChoice = "Qsync") {
      Run, %DriveName%\Qsync,,max
  } Else If (FChoice = "Report") {
      Run, %DriveName%\Datas\Reports\SXU_%A_YYYY%,,max
  } Else If (FChoice = "Temp") {
      Run, %DriveName%\Temp\360chrome,,max
  } 
  GuiControl, Choose, FChoice, 1  
Return
ButtonInkscape:    ; run Inkscape
    Gui,submit,nohide
    If WinExist("Inkscape ahk_exe inkscape.exe") { 
       WinActivate, Inkscape ahk_exe inkscape.exe
    } Else { 
       Run, %doshome%\Inkscape\inkscape.exe
    }
Return
ButtonJabRef:    ; run Jabref
    Gui,submit,nohide 
    If WinExist("JabRef ahk_exe JabRef.exe") { 
       WinActivate, JabRef ahk_exe JabRef.exe
    } Else { 
       Run, "C:\Program Files\JabRef\JabRef.exe"
    } 
Return
ButtonMS:    ; run Materials Studio
    Gui,submit,nohide
    If WinExist("MS8 - Materials Studio ahk_exe MatStudio.exe") { 
       WinActivate, MS8 - Materials Studio ahk_exe MatStudio.exe
    } Else { 
       Run, "C:\Program Files (x86)\Accelrys\Materials Studio 8.0\bin\MatStudio.exe"
    } 
Return 
Soft:    ; run soft not used very often
  Gui,submit,nohide
  If (SChoice = "Soft") {
        Run, "C:\Program Files (x86)\360\360Safe\SoftMgr\SoftMgr.exe" /start=desktop
  } Else If (SChoice = "CalCulator") { 
    If WinExist("SpeedCrunch ahk_exe speedcrunch.exe") { 
        WinActivate, SpeedCrunch ahk_exe speedcrunch.exe
    } Else { 
        Run, %doshome%\SpeedCrunchPortable\SpeedCrunchPortable.exe
    }
  } Else If (SChoice = "FileSync") {
    If WinExist("ahk_class wxWindowNR ahk_exe FreeFileSync_x64.exe") {
        WinActivate, ahk_class wxWindowNR ahk_exe FreeFileSync_x64.exe
      } Else { 
        Run, %DriveName%\Datas\Softs\DoNotSync\FreeFileSync\FreeFileSync.exe
      }
  } Else If (SChoice = "Gview") {
    If WinExist("GaussView 5.0.9 ahk_exe gview.exe") {
        WinActivate, GaussView 5.0.9 ahk_exe gview.exe
      } Else { 
        Run, C:\G09W\gview.exe
      }
  } Else If (SChoice = "Frozen") {
      If WinExist("Warcraft III ahk_class Warcraft III") {
        WinActivate, Warcraft III ahk_class Warcraft III
      } Else { 
        Run, "%DriveName%\Datas\Softs\Warcraft III 1.24\Frozen Throne.exe"
      } 
  } Else If (SChoice = "QQ") {
    If WinExist("QQ ahk_exe QQ.exe") {
        WinActivate,QQ ahk_exe QQ.exe
      } Else { 
        Run, "C:\Program Files (x86)\Tencent\QQLite\Bin\QQScLauncher.exe"
      } 
  } Else If (SChoice = "Qsync") {
    Run, "C:\Program Files (x86)\QNAP\Qsync\Qsync.exe" 
  } Else If (SChoice = "RSS") {
    If WinExist("QuiteRSS.exe ahk_exe QuiteRSS.exe") {
        WinActivate, QuiteRSS.exe ahk_exe QuiteRSS.exe
      } Else {
        Run, %DriveName%\Datas\Softs\DraftTools\RSS\QuiteRSS-0.18.4\QuiteRSS.exe
      }
    
  } Else If (SChoice = "EleTable") {
    If WinExist("Periodic Table ahk_exe ADPT.exe") {
        WinActivate,Periodic Table ahk_exe ADPT.exe
      } Else { 
        Run, "C:\Program Files (x86)\freshney.org\Periodic Table\ADPT.exe"
      } 
  } Else If (SChoice = "PdfEdit") {
    If WinExist("ahk_class GlassWndClass-GlassWindowClass-2") {
        WinActivate, ahk_class GlassWndClass-GlassWindowClass-2
      } Else {
        Run, "C:\Program Files (x86)\PDFsam Basic\pdfsam.exe"
      } 
  } Else If (SChoice = "TeamView") {
    Run, "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
  } Else If (SChoice = "Vesta") {
    If WinExist("ahk_class wxWindowNR") {
        WinActivate, ahk_class wxWindowNR
      } Else { 
        Run, %doshome%\VESTA64\VESTA.exe
      } 
  } Else If (SChoice = "Vsim") {
    If WinExist("Command panel ahk_exe v_sim.exe") {
        WinActivate, Command panel ahk_exe v_sim.exe
      } Else { 
        Run, %doshome%\v_sim\bin\v_sim.exe
      } 
  }
  GuiControl, Choose, SChoice, 1
Return
ButtonSSH:    ; run ssh MobaXterm
    Gui,submit,nohide
    If WinExist("ahk_class TMobaXtermForm") {
       WinActivate, ahk_class TMobaXtermForm
    } Else { 
       Run, %DriveName%\Datas\Softs\DoNotSync\MobaXterm\MobaXterm_Personal.exe
    }
Return 
ButtonVeusz:    ; run plot soft Veusz
    Gui,submit,nohide
    If WinExist("Veusz ahk_exe veusz.exe") {
       WinActivate,Veusz ahk_exe veusz.exe
    } Else { 
       Run, "C:\Program Files (x86)\Veusz\veusz.exe"
    }  
Return
Close:    ; Reboot, shutdown
  Gui,submit,nohide
  If (CChoice = "Close") {
    Gui, Destroy
  } Else If (CChoice = "Exit") {
    MsgBox,4,, Are your sure to Exit App?
    IfMsgBox, Yes
       ExitApp
  } Else If (CChoice = "LockWin") {
    Run, C:\Windows\System32\rundll32.exe user32.dll LockWorkStation 
  } Else If (CChoice = "Logoff") {
    MsgBox,4,, Are your sure to Logoff?
    IfMsgBox, Yes
      Shutdown, 0
  } Else If (CChoice = "ShutDown") {
    MsgBox,4,, Are your sure to Shut Down?
    IfMsgBox, Yes
      Shutdown, 1
  } Else If (CChoice = "Reload") {
      Reload
  } Else If (CChoice = "Reboot") {
    MsgBox,4,, Are your sure to Reboot?
    IfMsgBox, Yes
      Shutdown, 2
  }
  GuiControl, Choose, CChoice, 1
Return
