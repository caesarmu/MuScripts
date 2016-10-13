;variables DriveName and browser defined in main file

DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配
Html:    ; open Folders
  Gui,Menu:Submit,nohide
  If(HChoice ~= "Html") {
     Run, %DosHome%\Source\Notes\Tasks_self.html,,max
  } Else If(HChoice ~= "163Mail") {
    If(pass2 == "") {
       Inputbox,pass2,PassWord,Enter the PassWord for 163 Email:,,300,140
       If(ErrorLevel != 0 || pass2 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, http://email.163.com/,,max
    WinWaitActive, ahk_exe %browser%,,10 
    If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Del 25}{Backspace 25}caesarmu{Tab}
    SendInput, {Del 25}{Backspace 25}%pass2%{Enter} 
  } Else If(HChoice ~= "Amd10") {
    If(pass4 == "") {
       Inputbox,pass4,PassWord,Enter the PassWord for BQSS on amd10:,,300,140
       If(ErrorLevel != 0 || pass4 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://115.24.3.201:1215,,max
     WinWaitActive, 115.24.3.201:1215 ahk_exe  %browser%,,10
     SwitchIME(0x08040804)
     Sleep, 1000
     SendInput, %pass4%{Enter}
    } Else If(HChoice ~= "GitHub") {
    If(pass2 == "") {
       Inputbox,pass2,PassWord,Enter the PassWord for GitHub:,,300,140
       If(ErrorLevel != 0 || pass2 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, https://github.com/login?login=caesarmu,,max
    WinWaitActive, ahk_exe %browser%,,10
    If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Del 25}{Backspace 25}%pass2%{Enter} 
  } Else If(HChoice ~= "Gmail") {
    If(pass3 == "") {
       Inputbox,pass3,PassWord,Enter the PassWord for Gmail:,,300,140
       If(ErrorLevel != 0 || pass3 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, https://mail.google.com,,max
    WinWaitActive, ahk_exe  %browser%,,10
    If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Del 25}{BackSpace 25}%pass3%{Tab}{Enter}
  } Else If(HChoice ~= "Gpu3") {
    If(pass6 == "") {
       Inputbox,pass6,PassWord,Enter the PassWord for BQSS on Gup3:,,300,140
       If(ErrorLevel != 0 || pass6 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://115.24.3.201:1215,,max
     WinWaitActive, 115.24.3.201:1215 ahk_exe  %browser%,,10
     SwitchIME(0x08040804)
     Sleep, 1000
     SendInput, %pass6%{Enter}
  } Else If(HChoice ~= "InoRSS") {
    If(pass3 == "") {
       Inputbox,pass3,PassWord,Enter the PassWord for InoReader:,,300,140
       If(ErrorLevel != 0 || pass3 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://www.inoreader.com/login,,max
     WinWaitActive, Inoreader ahk_exe  %browser%,,10
     If( ! ColorWait(3000))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Del 25}{Backspace 25}ywmu@live.com{Tab}
     SendInput, {Del 25}{Backspace 25}%pass3%{Enter}
  } Else If(HChoice ~= "JD") {
    If(pass2 == "") {
       Inputbox,pass2,PassWord,Enter the PassWord for JD:,,300,140
       If(ErrorLevel != 0 || pass2 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, https://passport.jd.com/new/login.aspx,,max
     WinWaitActive, ahk_exe  %browser%,,10 
     If( ! ColorWait(3000)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Tab}{Del 25}{Backspace 25}13934597161{Tab}
     SendInput, {Del 25}{Backspace 25}%pass2%{Enter}
  } Else If(HChoice ~= "JH") {
    If(pass3 == "") {
       Inputbox,pass3,PassWord,Enter the PassWord for JH:,,300,140
       If(ErrorLevel != 0 || pass3 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://172.24.3.31:8080/appform/login,,max
     WinWaitActive, JH Appform  ahk_exe  %browser%,,10
     If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Tab 3}{Del 25}{Backspace 25}yuewenmu{Tab}
     SendInput, {Del 25}{Backspace 25}%pass3%{Enter}
  } Else If(HChoice ~= "LiveMail") {
    If(pass2 == "") {
       Inputbox,pass2,PassWord,Enter the PassWord for Live Email:,,300,140
       If(ErrorLevel != 0 || pass2 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, http://mail.live.com/,,max
    WinWaitActive, ahk_exe %browser%,,10 
    If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Del 25}{Backspace 25}ywmu@live.com{Tab}
    SendInput, {Del 25}{Backspace 25}%pass2%{Tab 2}{Enter}  
  } Else If(HChoice ~= "NAS") {
    If(pass8 == "") {
       Inputbox,pass8,PassWord,Enter the PassWord for NAS:,,300,140
       If(ErrorLevel != 0 || pass8 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, https://caesarmu.myqnapcloud.com:5121/cgi-bin/,,max
     WinWaitActive, NAS4MU ahk_exe  %browser%,,10 
     If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    } 
     SendInput, {Del 25}{Backspace 25}admin{Tab}
     SendInput, {Del 25}{Backspace 25}%pass8%{Enter}
  } Else If(HChoice ~= "Neu6") {
    If(pass3 == "") {
       Inputbox,pass3,PassWord,Enter the PassWord for Neu6:,,300,140
       If(ErrorLevel != 0 || pass3 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://bt.neu6.edu.cn/member.php?mod=logging&action=login,,max
     WinWaitActive, ahk_exe  %browser%,,10 
     If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Del 25}{Backspace 25}caesarmu{Tab}
     SendInput, {Del 25}{Backspace 25}%pass3%{Tab 2}{Enter}
  } Else If(HChoice ~= "PMMP") { 
    If(pass5 == "") {
       Inputbox,pass5,PassWord,Enter the PassWord for PMMP:,,300,140
       If(ErrorLevel != 0 || pass5 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://115.24.3.212:8080/pmmp/index.jsp,,max
     WinWaitActive, ahk_exe  %browser%,,10 
     If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Tab}{Del 25}{Backspace 25}muyw{Tab}
     SendInput, {Del 25}{Backspace 25}%pass5%{Tab}{Enter} 
  } Else If(HChoice ~= "Portal") {
    If(pass1 == "") {
       Inputbox,pass1,PassWord,Enter the PassWord for Portal:,,300,140
       If(ErrorLevel != 0 || pass1 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, http://myportal.sxu.edu.cn/,,max
     WinWaitActive, ahk_exe  %browser%,,10 
     If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
     }
     SendInput, {Del 25}{Backspace 25}ywmu{Tab}
     SendInput, {Del 25}{Backspace 25}%pass1%{Tab}{Enter}
  } Else If(HChoice ~= "QQMail") {
    If(pass2 == "") {
       Inputbox,pass2,PassWord,Enter the PassWord for QQ Email:,,300,140
       If(ErrorLevel != 0 || pass2 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, https://w.mail.qq.com/,,max
    WinWaitActive, ahk_exe %browser%,,10 
    If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Tab}{Del 25}{Backspace 25}y.w.mu@qq.com{Tab}
    SendInput, {Del 25}{Backspace 25}%pass2%{Enter}
  } Else If(HChoice ~= "Rinse") {
    If(pass2 == "") {
       Inputbox,pass9,PassWord,Enter the PassWord for RSS Rinse:,,300,140
       If(ErrorLevel != 0 || pass9 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, http://feedrinse.com/login.php?login=true&username=caesarmu,,max
    WinWaitActive, ahk_exe %browser%,,10 
    If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Tab 10}{Del 25}{Backspace 25}%pass9%{Enter}
  } Else If(HChoice ~= "SxuMail") {
    If(pass1 == "") {
       Inputbox,pass1,PassWord,Enter the PassWord for SXU Email:,,300,140
       If(ErrorLevel != 0 || pass1 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, https://exmail.qq.com/cgi-bin/loginpage?param=ywmu@sxu.edu.cn,,max
    WinWaitActive, ahk_exe  %browser%,,10 
    If( ! ColorWait(500)) {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
    SendInput, {Tab 7}{Del 25}{Backspace 25}ywmu@sxu.edu.cn{Tab}
    SendInput, {Del 25}{Backspace 25}%pass1%{Tab}{Enter} 
  } Else If(HChoice ~= "SxuVPN") {
    If(pass1 == "") {
       Inputbox,pass1,PassWord,Enter the PassWord for SXU VPN:,,300,140
       If(ErrorLevel != 0 || pass1 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
    Run, https://sslvpn.sxu.edu.cn/dana-na/auth/url_default/welcome.cgi,,max
    PassSSL(browser)
    WinWaitActive, ahk_exe  %browser%,,10 
    Sleep, 2000
    SendInput, {Del 25}{Backspace 25}ywmu{Tab}
    SendInput, {Del 25}{Backspace 25}%pass1%{Tab}{Enter}
  } Else If(HChoice ~= "Taobao") {
    If(pass2 == "") {
       Inputbox,pass2,PassWord,Enter the PassWord for Taobao:,,300,140
       If(ErrorLevel != 0 || pass2 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, https://login.taobao.com/,,max
     WinWaitActive, ahk_exe  %browser%,,10
     If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Tab 6}{Enter}+{Tab 10}{Del 25}{Backspace 25}13934597161{Tab}
     SendInput, {Del 25}{Backspace 25}%pass2%
  } Else If(HChoice ~= "TH2") {
     Run, https://61.144.43.67:6443/sslvpn/html/login_simple.html,,max
     WinWaitActive,SSL VPN Service ahk_exe  %browser%,,30
     If( ! ColorWait(3000))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
     }
     SendInput, {Del 25}{Backspace 25}nsfc2015_267{Tab}
     SendInput, {Del 25}{Backspace 25}O1y577rn{Tab 4}{Enter}
     WinWaitActive, SSLVPN ahk_exe  %browser%,,10
     MsgBox,4,, Do you want to open the TH2 Timer?,30
     IfMsgBox, Yes
     {  Run, https://172.16.22.11:10021/,,max
        If( ! ColorWait(3000))  {
           GuiControl, Menu:Choose, HChoice, 1
           Return
        }
        SendInput, {Tab}nsfc2015_267{Tab}
        SendInput, {Enter}
        WinWaitActive, ahk_class #32770,,10
        Sleep, 750
        SendInput, !n %DosHome%{Enter}
        Sleep, 750
        SendInput, ..\Tianhe2\nsfc2015_267.id{Enter}
     }
  } Else If(HChoice ~= "VASP") {
    If(pass7 == "") {
       Inputbox,pass7,PassWord,Enter the PassWord for VASP site:,,300,140
       If(ErrorLevel != 0 || pass7 == "" ) {   ; push close or ESC or  nothing Input
          GuiControl, Menu:Choose, HChoice, 1
          Return
       } 
    }
     Run, https://www.vasp.at/,,max
     WinWaitActive,The VASP site ahk_exe  %browser%,,30
     If( ! ColorWait(500))  {
       GuiControl, Menu:Choose, HChoice, 1
       Return
    }
     SendInput, {Tab 23}{Del 25}{Backspace 25}5-1253{Tab}
     SendInput, {Del 25}{Backspace 25}%pass7%{Tab}{Enter}
  } Else If(HChoice ~= "WeChat") {
     Run, https://web.wechat.com/,,max
  }
  GuiControl, Menu:Choose, HChoice, 1
Return
