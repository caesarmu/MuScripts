DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配

; Functions
SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
    Sleep, 200
    Return
}  ;http://www.zhihu.com/question/41446565/answer/91110371

;EnvGet, user, UserName
; user Administrator: 22inch, 1920*1080, pcscale=1, browserscale=1.25
; user Mu: 15inch, 1920*1080, pcscale=1, browserscale=1.25, two screen  
ColorWait(cycle){
; work with Pace4Chrome, modify its color to DD0000
  Lstart :=false
  Loop, %cycle% {  
       PixelGetColor,VarColor, 1865,208,RGB    
       If (VarColor = "0xDD0000" ) {
           Lstart :=true 
       }
       If ( Lstart && VarColor <> "0xDD0000" ) {
            Lfound :=true
            Break
       } Else  { 
            Lfound :=false
            Sleep, 10
       }          
  }
  SwitchIME(0x08040804)
  Sleep, 500 
  Return %Lfound%
}

PassSSL(browser){
; pass the ssl check for IE or liebao
     Sleep, 3000
     SwitchIME(0x08040804)
     If (browser = "liebao.exe" || browser = "iexplore.exe" ) {
        Send, {Click 600,300}
        SendInput, {Tab 2}{Enter}  
     }
}

LastDir(){
     WinGetText,latdirtext, ahk_class CabinetWClass
     StringReplace, latdirtext, latdirtext, `r`n,%A_SPACE%, All
     Lastdir := RegExReplace(latdirtext,".*地址: (.*) 地址区段.*", "$1")
     Return %Lastdir%
}

DownListGet(maxn,keyword){
    Loop, %maxn% {
         SendInput, {Down} 
         Clipboard=
         SendInput, ^c
         ClipWait, 2
         If (InStr(Clipboard,keyword) >0) {
            SendInput, {Enter}
            Break
        }
    }
    Return
}

EncryPass(inpass,charshift){
  outpass :=""
  Loop, Parse, inpass 
  {
        outchar :=Chr(Asc(A_LoopField)+charshift)
        outpass :=outpass outchar
  }
  Return %outpass%
}

; retrive results of cmd, modified from  https://autohotkey.com/board/topic/15455-stdouttovar/page-7 (nfl)
StdoutToVar_CreateProcess(sCmd, bStream="", sDir="", sInput="") {
   bStream=   ; not implemented
   DllCall("CreatePipe","Ptr*",hStdInRd,"Ptr*",hStdInWr,"Uint",0,"Uint",0)
   DllCall("CreatePipe","Ptr*",hStdOutRd,"Ptr*",hStdOutWr,"Uint",0,"Uint",0)
   DllCall("SetHandleInformation","Ptr",hStdInRd,"Uint",1,"Uint",1)
   DllCall("SetHandleInformation","Ptr",hStdOutWr,"Uint",1,"Uint",1)
   If ( A_PtrSize = "4" ) {
      VarSetCapacity(pi, 16, 0)
      sisize:=VarSetCapacity(si,68,0)
      NumPut(sisize,    si,  0, "UInt")
      NumPut(0x100,     si, 44, "UInt")
      NumPut(hStdInRd , si, 56, "Ptr")
      NumPut(hStdOutWr, si, 60, "Ptr")
      NumPut(hStdOutWr, si, 64, "Ptr")
    } Else If (A_PtrSize = "8" ) {
      VarSetCapacity(pi, 24, 0)
      sisize:=VarSetCapacity(si,96,0)
      NumPut(sisize,    si,  0, "UInt")
      NumPut(0x100,     si, 60, "UInt")
      NumPut(hStdInRd , si, 80, "Ptr")
      NumPut(hStdOutWr, si, 88, "Ptr")
      NumPut(hStdOutWr, si, 96, "Ptr")
    }
    DllCall("CreateProcess", "Uint", 0, "Ptr", &sCmd, "Uint", 0, "Uint", 0, "Int", True, "Uint", 0x08000000, "Uint", 0, "Ptr", sDir ? &sDir : 0, "Ptr", &si, "Ptr", &pi)
    DllCall("CloseHandle","Ptr",NumGet(pi,0))
    DllCall("CloseHandle","Ptr",NumGet(pi,A_PtrSize))
    DllCall("CloseHandle","Ptr",hStdOutWr)
    DllCall("CloseHandle","Ptr",hStdInRd)
    If ( sInput <> "" ) {
       FileOpen(hStdInWr, "h", "UTF-8").Write(sInput)
    }
    DllCall("CloseHandle","Ptr",hStdInWr)
    VarSetCapacity(sTemp,4095)
    nSize:=0
    loop {
         result:=DllCall("Kernel32.dll\ReadFile", "Uint", hStdOutRd,  "Ptr", &sTemp, "Uint", 4095,"UintP", nSize,"Uint", 0)
         If (result = "0") {
            break
         } else {
           sOutput:= sOutput . StrGet(&sTemp,nSize,"UTF-8")
         }
    }
    DllCall("CloseHandle","Ptr",hStdOutRd)
    Return,sOutput
}